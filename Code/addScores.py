import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from judging import *
import pandas as pd
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail
from sendgrid.helpers.mail import Attachment, FileContent, FileName, FileType, Disposition
import base64
import io


def comment_to_string(comments):
    if len(comments) > 1:
        result = ''
        for c in comments:
            result+=c[0] + ': ' + c[1] + '\n'
        return str(result)[0:len(result)-2]
    elif len(comments) == 1:
        print(comments)
        return comments[0][0] + ': ' + comments[0][1]


def hello_world(request):
    # Use a service account.
    # cred = credentials.Certificate('key.json')
    cred = credentials.Certificate('Code/key.json')
    app = firebase_admin.initialize_app(cred)
    db = firestore.client()

    scores = get_scores(db)
    projects = get_projects(db)
    comments = score_all_projects(scores, projects)

    for project in projects:
        projects[project].upload(db)

    df_dict = dict()
    for project in projects:
        df_dict[project] = [projects[project].score, comment_to_string(comments[project])]
    results = pd.DataFrame.from_dict(df_dict, orient='index', columns=['Score', 'Comments'])
    results.sort_values(by=['Score'], inplace=True, ascending=False)
    
    

    print(results)

    # Delete app
    firebase_admin.delete_app(app)

    # Send email

    s = io.StringIO()
    results.to_csv(s, sep=',', encoding='utf-8')
    encoded_file = base64.b64encode(s.getvalue().encode()).decode()

    attachedFile = Attachment(
        FileContent(encoded_file),
        FileName('results.csv'),
        FileType('application/csv'),
        Disposition('attachment')
    )
    message = Mail(
        from_email='razat.sutradhar@gmail.com',
        to_emails='razat74@gmail.com',
        subject='Poster Judging Results',
        html_content='Results are attached below:')
    message.attachment = attachedFile
    try:
        sg = SendGridAPIClient('')
        response = sg.send(message)
    except Exception as e:
        pass

    return 'Hello World!'