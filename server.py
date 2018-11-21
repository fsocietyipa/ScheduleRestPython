from flask import Flask
from flask_restful import Api, Resource, reqparse
import urllib.parse as urlparse
import os
import postgresql


dburl = urlparse.urlparse(os.environ['DATABASE_URL'])
dbname = dburl.path[1:]
dbuser = dburl.username
dbpassword = dburl.password
dbhost = dburl.hostname
dbport = dburl.port

db = postgresql.open(user=dbuser, password=dbpassword, database=dbname, host=dbhost, port=dbport)
#db = postgresql.open("pq://postgres:password@localhost:5432/Schedule")

app = Flask(__name__)
api = Api(app)

class Times(Resource):
    def get(self):
        timesData = {"times": {}}
        times = db.query("SELECT * FROM times");
        for i in range(1, len(times[0])):
            timesData["times"][str(i)] = {}
            timesData["times"][str(i)]["start_time"] = times[0][i]
            timesData["times"][str(i)]["end_time"] = times[1][i]
        return timesData

class Subjects(Resource):
    def get(self):
        subjectsData = {"subjects": {}}
        subjects = db.query("SELECT * FROM subjects");
        for i in subjects:
            subjectsData["subjects"][i[0]] = i[1]
        return subjectsData

class Teachers(Resource):
    def get(self):
        teachersData = {"teachers": {}}
        teachers = db.query("SELECT * FROM teachers");
        for i in teachers:
            teachersData["teachers"][i[0]] = i[1]
        return teachersData

class SubjectTypes(Resource):
    def get(self):
        subjectTypesData = {"subject_types": {}}
        subjectTypes = db.query("SELECT * FROM subject_types");
        for i in subjectTypes:
            subjectTypesData["subject_types"][i[0]] = i[1]
        return subjectTypesData

class Bundles(Resource):
    def get(self):
        bundlesData = {"bundles": {}}
        bundles = db.query("SELECT * FROM bundles");
        for i in bundles:
            bundlesData["bundles"][i[0]] = i[1]
        return bundlesData

class Timetables(Resource):
    def get(self):
        timetablesData = {"timetable": []}
        timetables = db.query("select * from timetables;");
        for i in timetables:
            tmpData = {}
            tmpData["id"] = i["id"]
            tmpData["subject_id"] = i["subject_id"]
            tmpData["subject_type_id"] = i["subject_type_id"]
            tmpData["teacher_id"] = i["teacher_id"]
            tmpData["bundle_id"] = i["bundle_id"]
            tmpData["day_id"] = i["day_id"]
            tmpData["time_id"] = i["time_id"]
            timetablesData["timetable"].append(tmpData)
        return timetablesData

class AllData(Resource):
    def get(self):
        return  {**Timetables.get(self), **Bundles.get(self), **SubjectTypes.get(self), **Teachers.get(self), **Subjects.get(self), **Times.get(self)}

class BeautifulData(Resource):
    def get(self):
        timetableData = Timetables.get(self)
        allData = {**Bundles.get(self), **SubjectTypes.get(self), **Teachers.get(self), **Subjects.get(self), **Times.get(self)}

        for i in timetableData["timetable"]:
            i["subject_id"] = allData["subjects"][i["subject_id"]]
            i["subject_type_id"] = allData["subject_types"][i["subject_type_id"]]
            i["teacher_id"] = allData["teachers"][i["teacher_id"]]
            i["bundle_id"] = allData["bundles"][i["bundle_id"]]
            i["time_value"] = allData["times"][i["time_id"]]

        return timetableData


class Main(Resource):
    def get(self):
        return {"msg": "Hello, World!"}

api.add_resource(Times, "/times")
api.add_resource(Subjects, "/subjects")
api.add_resource(Teachers, "/teachers")
api.add_resource(SubjectTypes, "/subjectTypes")
api.add_resource(Bundles, "/bundles")
api.add_resource(Timetables, "/timetables")
api.add_resource(AllData, "/allData")
api.add_resource(BeautifulData, "/beautifulData")
api.add_resource(Main, "/")

host = os.environ.get('IP', '0.0.0.0')
port = int(os.environ.get('PORT', 80))


app.run(port=port, host=host)
