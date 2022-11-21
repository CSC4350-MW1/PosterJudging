import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import json
from judging import *
import pandas as pd
import random

# Use a service account.
cred = credentials.Certificate('Code/key.json')
app = firebase_admin.initialize_app(cred)

db = firestore.client()

#clear current grading assignments
clear_grading_assignments(db)

# Grading
graders_db = db.collection(u'Graders')
grader_data = graders_db.get()

graders = dict()
for grader in grader_data:
    g = Grader(**json.loads(json.dumps(grader.to_dict())))
    graders[g.grader_id] = g

# Projects
projects_db = db.collection(u'Projects')
projects_data = projects_db.get()

projects = dict()
for data in projects_data:
    p = Project(**json.loads(json.dumps(data.to_dict())))
    projects[p.project_id] = p


grading_queue =list(graders.keys())
random.shuffle(grading_queue)

for project in projects:
    grading_stack = []
    for i in range(2):
        while(len(grading_queue) > 0 and grading_queue[0] in graders and projects[project].mentor == graders[grading_queue[0]].grader_id):
            grading_stack.append(grading_queue.pop(0))
        if (projects[project].mentor not in graders[grading_queue[0]].grader_id and project not in graders[grading_queue[0]].assigned_projects):
            graders[grading_queue[0]].assigned_projects.append(project)
            grading_queue.append(grading_queue.pop(0))
    grading_queue = grading_stack + grading_queue


for grader in graders:
    graders[grader].upload(db)

firebase_admin.delete_app(app)