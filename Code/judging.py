import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import json


class Project:
    def __init__(self, mentor, project_title, student_emails, student_names, student_ids, is_undergrad=True, project_id=None, score=0):
        self.mentor = mentor
        self.project_title = project_title
        self.student_emails = student_emails
        self.student_names = student_names
        self.student_ids = student_ids
        self.score = score
        self.is_undergrad = is_undergrad

        if project_id == None:
            self.project_id = self.generate_id()
        else:
            self.project_id = project_id

    # Generates a unique id for the project
    def generate_id(self):
        return str(self.project_title+'-'+self.student_names[0].replace(' ', '_'))

    # Returns the project as a JSON object
    def to_json(self):
        return json.dumps(self.__dict__)

    # Uploads the project to the database
    def upload(self, db):
        json_data = json.dumps(self.__dict__)
        db.collection(u'Projects').document(self.project_id).set(json.loads(json_data))

    # Cumulates the scores of the project
    def add_scores(self, scores):
        final_score = 0
        num_of_scores = len(scores)
        for score in scores:
            final_score += sum(score)
        self.score = final_score/num_of_scores
        return self.score

        

class Score:
    def __init__(self, project_id, grader_id, score=[1,1,1,1,1,1,1], comments='No Comments', score_id=None):
        self.project_id = project_id
        self.grader_id = grader_id
        self.score = score
        self.comments = comments
        if(score_id == None):
            self.score_id = self.generate_id()
        else:
            self.score_id = score_id
    
    # Generates a unique id for the score
    def generate_id(self):
        return str(self.project_id+'-'+self.grader_id)

    # Returns the score as a JSON object
    def to_json(self):
        return json.dumps(self.__dict__)
    
    # Uploads the score to the database
    def upload(self, db):
        json_data = json.dumps(self.__dict__)
        db.collection(u'Scores').document(self.score_id).set(json.loads(json_data))
    


class Grader:
    def __init__(self, grader_id, grader_name, assigned_projects=[]):
        self.grader_id = grader_id
        self.grader_name = grader_name
        self.assigned_projects = assigned_projects

    # Returns the grader as a JSON object
    def to_json(self):
        return json.dumps(self.__dict__)
    
    # Uploads the grader to the database
    def upload(self, db):
        json_data = json.dumps(self.__dict__)
        db.collection(u'Graders').document(self.grader_id).set(json.loads(json_data))
    
    #clear grading assignments
    def clear_grading(self, db):
        self.assigned_projects = list()
        self.upload(db)

    def __str__(self):
        return str(self.grader_name + " " + self.grader_id + " " + str(self.assigned_projects))




def score_all_projects(scores, project_dict):
    comment_dict = dict()
    project_scores = dict()
    for score in scores:
        if score.project_id in project_scores:
            project_scores[score.project_id].append(score.score)
        else:
            project_scores[score.project_id] = [score.score]
        
        if score.project_id in comment_dict:
            comment_dict[score.project_id].append((score.grader_id,score.comments))
        else:
            comment_dict[score.project_id] = [(score.grader_id,score.comments)]
    
    key_intersection = set(project_dict.keys()).intersection(set(project_scores.keys()))
    for project_id in key_intersection:
        project_dict[project_id].add_scores(project_scores[project_id])
    return comment_dict

def clear_grading_assignments(db):
    graders_db = db.collection(u'Graders')
    graders_data = graders_db.get()
    for data in graders_data:
        grader = Grader(**json.loads(json.dumps(data.to_dict())))
        grader.clear_grading(db)

def get_graders(db):
    # Grading
    graders_db = db.collection(u'Graders')
    grader_data = graders_db.get()

    graders = dict()
    for grader in grader_data:
        g = Grader(**json.loads(json.dumps(grader.to_dict())))
        graders[g.grader_id] = g
    return graders

def get_projects(db):
    # Get projects
    projects_db = db.collection(u'Projects')
    projects_data = projects_db.get()

    projects = dict()
    for project in projects_data:
        p = Project(**json.loads(json.dumps(project.to_dict())))
        projects[p.project_id] = p
    return projects

def get_scores(db):
    # Get scores
    scores_db = db.collection(u'Scores')
    scores_data = scores_db.get()

    scores = list()
    for score in scores_data:
        s = Score(**json.loads(json.dumps(score.to_dict())))
        scores.append(s)
    return scores
