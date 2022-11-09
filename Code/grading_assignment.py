import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Use a service account.
cred = credentials.Certificate('Code\key.json')
app = firebase_admin.initialize_app(cred)

db = firestore.client()

# Grading
grading = db.collection(u'Grading')
grading_data = grading.get()

print("grading:")
for data in grading_data:
    print(data.to_dict())


# Project
project_data = db.collection(u'Projects').get()

print("\nprojects:")
for data in project_data:
    print(data.to_dict())

# Scores
scores_data = db.collection(u'Scores').get()

print("\nscores:")
for data in scores_data:
    print(data.to_dict())