from transformers import pipeline
import requests
import json

classifier = pipeline("text-classification", model="j-hartmann/emotion-english-distilroberta-base", top_k=1)

url = 'http://fanyi.youdao.com/translate'  
key = {
    'type': "AUTO",
    "doctype": "json",
    "version": "2.1",
    "keyfrom": "fanyi.web",
    "ue": "UTF-8",
    "action": "FY_BY_CLICKBUTTON",
    "typoResult": "true"
}
eng2ch = {'anger': '愤怒', 'disgust': '厌恶', 'fear': '害怕', 'joy': '喜悦', 'neutral': '中立', 'sadness': '悲伤', 'surprise': '惊喜'}

f = open("input_text.txt", 'r', encoding='utf-8')
text_raw = f.read()
text_list = text_raw.replace('。', '，').replace('!', '，').replace('?', '，').split('，')
f_out = open("result_text.txt", 'w', encoding='utf-8')
for text in text_list:
    if text != '':
        key['i'] = text
        response = requests.post(url, data=key)
        translate_results = json.loads(response.text)
        text_eng = translate_results['translateResult'][0][0]['tgt']
        result_raw = classifier(text_eng)
        result = eng2ch[result_raw[0][0]['label']]
        f_out.write(text + "：" + result + "\n")
f.close()
f_out.close()
