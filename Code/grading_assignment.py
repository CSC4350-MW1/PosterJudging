import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import json
from judging import *
import random

# Use a service account.
# Use following in cloud:
#cred = credentials.Certificate('key.json')
cred = credentials.Certificate('Code/key.json')
app = firebase_admin.initialize_app(cred)

db = firestore.client()

#clear current grading assignments
clear_grading_assignments(db)

# Grading
graders = get_graders(db)

# Projects
projects = get_projects(db)


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