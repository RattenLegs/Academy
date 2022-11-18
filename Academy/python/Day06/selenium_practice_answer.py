
'''
네이버로 접속하셔서 뉴스스탠드 위쪽에 있는 파란색 '뉴스홈' 링크를
클릭하세요.

상단에 있는 메뉴 중 정치, 경제, 사회, 생활/문화, 세계, IT/과학
탭을 돌아다니면서 헤드라인 뉴스 4개씩 클릭해 주시면 됩니다.
뒤로가기는 driver.back() 메서드로 뒤로가기 가능합니다.

XPATH를 따다 보면 규칙을 발견하실 수 있을 겁니다.
반복문 이용해서 클릭 명령을 내려 주시면 됩니다.
24개의 명령을 일일히 쓰라는 게 아니에요. 규칙을 꼭 발견 하세요.
상단의 탭에도 규칙이 존재하고요
뉴스도, 사진의 있는 뉴스와 그렇지 않은 뉴스가 XPATH가 조금씩
다른 것을 유념하세요
'''
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver = webdriver.Chrome('C:/Users/user/Desktop/LKM/python/chromedriver.exe')
driver.get("http://www.naver.com")
time.sleep(1)

# 뉴스 홈 클릭
driver.find_element(By.XPATH, '//*[@id="NM_NEWSSTAND_HEADER"]/div[2]/a[1]').click()
time.sleep(1)
