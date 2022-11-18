
# 셀레늄: 웹 자동화 및 웹의 소스코드를 수집하는 모듈
# cmd(관리자) -> pip install selenium(셀레늄 라이브러리 다운로드)
# 셀레늄 import 진행
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# 다운로드 받은 크롬 물리드라이버 가동 명령
driver = webdriver.Chrome('C:/Users/user/Desktop/LKM/python/chromedriver.exe')

# 물리 드라이버로 사이트 이동 명령
driver.get("http://www.naver.com")

time.sleep(1.5)
'''
# 자동으로 버튼이나 링크 클릭 제어하기
# * xPath -> XML Path Language
# 문서의 특정 요소나 속성에 접근하기 위한 경로를 지정하는 언어
# 요소의 증복없이 정확하게 표현히 쉬운 언어
login_btn = driver.find_element(By.XPATH, '//*[@id="account"]/a')
login_btn.click()

time.sleep(1.5)

# 자동으로 텍스트를 입력하기
id_input = driver.find_element(By.XPATH, '//*[@id="id"]')
id_input.send_keys('당신의 id')

time.sleep(1)

pw_input = driver.find_element(By.XPATH, '//*[@id="pw"]')
pw.input.send_keys('당신의 비밀번호')

time.sleep(1)
driver.find_element(By.XPATH, '//*[@id="log.login"]').click()
'''

# 네이버에 접속하셔서 검색창에 '오늘 날씨'를 입력하셔서
# 검색 후 가장 첫번째로 뜨는 네이버 뉴스를 띄워주세요.

driver.find_element(By.XPATH, '//*[@id="query"]').send_keys('오늘 날씨')
time.sleep(1)
driver.find_element(By.XPATH, '//*[@id="search_btn"]').click()
time.sleep(1)
driver.find_element(By.XPATH, '//*[@id="sp_nws_all1"]/div/div/div[1]/div[2]/a[2]').click()
