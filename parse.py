# Created by Rafael Belchior
import json
import sys
from pprint import pprint
reload(sys)
sys.setdefaultencoding('utf8')



try:
	fout = open("result-parsed.out", "w")
	with open('result.out') as f:
		data = json.load(f)
		text = data["response"]["results"]
		for excert in text:
			object = excert["alternatives"][0]["transcript"]
			fout.write(object + "\n")
	fout.close()
	f.close()
except AssertionError as err:
	print("==============================")
	print("========== ERROR =============")
	print("==============================")
	print("To fix it, delete result.out and run again the following command:")
	print("curl -H \"Authorization: Bearer \"$(gcloud auth application-default print-access-token) \
     -H \"Content-Type: application/json; charset=utf-8\" \
     \"https://speech.googleapis.com/v1/operations/NAME\" >> result.out")
	print("=======================")
	print(err)
pprint(data)