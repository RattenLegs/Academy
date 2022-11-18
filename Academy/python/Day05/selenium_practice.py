
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
# 일단 써보면서 규칙을 찾아 봅시다.

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

# 뉴스홈 누르기
driver.find_element(By.XPATH, '//*[@id="NM_NEWSSTAND_HEADER"]/div[2]/a[1]').click()
time.sleep(2)

# 완성작(정치): 정치만 달라서 정치를 따로 빼야 함
driver.find_element(By.XPATH, '/html/body/section/header/div[2]/div/div/div[1]/div/div/ul/li[2]/a/span').click()

n = 1 # 정치 페이지 내의 뉴스 번호
m = 0 # 사진 유무(2=사진 있음)

while n <= 4: # end
    if m == 2:
        driver.find_element(By.XPATH, '//*[@id="main_content"]/div/div[2]/div[1]/div[{}]/div[1]/ul/li[1]/div[{}]/a' .format(n, m)).click()
        
    else:
        driver.find_element(By.XPATH, '//*[@id="main_content"]/div/div[2]/div[1]/div[{}]/div[1]/ul/li[1]/div/a' .format(n)).click()

    time.sleep(2)
    driver.back()
    n += 1 # step


# 경제~세계
i = 3 # begin
while i <= 7: # end
    driver.find_element(By.XPATH, '//*[@id="lnb"]/ul/li[{}]/a/span' .format(i)).click()
    time.sleep(2)
    while n <= 4: # end
        if m == 2:
            driver.find_element(By.XPATH, '//*[@id="main_content"]/div/div[2]/div[1]/div[{}]/div[2]/ul/li[1]/div[{}]/a' .format(n, m)).click()
            
        else:
            driver.find_element(By.XPATH, '//*[@id="main_content"]/div/div[2]/div[1]/div[{}]/div[2]/ul/li[1]/div/a' .format(n)).click()

        time.sleep(2)
        driver.back()
        n += 1 # step
    
        if n == 4:
            i += 1 #step
    n = 1


# 문제점: 중간에 경제를 한번 더 클릭

'''
정치: /html/body/section/header/div[2]/div/div/div[1]/div/div/ul/li[2]/a/span
경제: /html/body/section/header/div[2]/div/div/div[1]/div/div/ul/li[3]/a/span
사회: /html/body/section/header/div[2]/div/div/div[1]/div/div/ul/li[4]/a/span
생활/문화: /html/body/section/header/div[2]/div/div/div[1]/div/div/ul/li[5]/a/span
IT/과학: /html/body/section/header/div[2]/div/div/div[1]/div/div/ul/li[6]/a/span
세계: /html/body/section/header/div[2]/div/div/div[1]/div/div/ul/li[7]/a/span
'''

'''
경제: //*[@id="lnb"]/ul/li[3]/a/span 
사회: //*[@id="lnb"]/ul/li[4]/a/span
생활문화: //*[@id="lnb"]/ul/li[5]/a/span
IT과학: //*[@id="lnb"]/ul/li[6]/a/span
세계: //*[@id="lnb"]/ul/li[7]/a/span
'''

'''
정치의 1번째 뉴스 : //*[@id="main_content"]/div/div[2]/div[1]/div[1]/div[1]/ul/li[1]/div[2]/a
정치의 2번째 뉴스 : //*[@id="main_content"]/div/div[2]/div[1]/div[2]/div[1]/ul/li[1]/div[2]/a
정치의 3번째 뉴스 : //*[@id="main_content"]/div/div[2]/div[1]/div[3]/div[1]/ul/li[1]/div/a
정치의 4번째 뉴스 : //*[@id="main_content"]/div/div[2]/div[1]/div[4]/div[1]/ul/li[1]/div[2]/a
사진 없는 정치 뉴스: //*[@id="main_content"]/div/div[2]/div[1]/div[3]/div[1]/ul/li[1]/div/a

//*[@id="main_content"]/div/div[2]/div[1]/div[1]/div[1]/ul/li[1]/div[2]/a
//*[@id="main_content"]/div/div[2]/div[1]/div[1]/div[2]/ul/li[1]/div[2]/a
//*[@id="main_content"]/div/div[2]/div[1]/div[1]/div[2]/ul/li[1]/div[2]/a

경제의 1번째 뉴스 : //*[@id="main_content"]/div/div[2]/div[1]/div[1]/div[2]/ul/li[1]/div[2]/a
경제의 2번째 뉴스 : //*[@id="main_content"]/div/div[2]/div[1]/div[2]/div[2]/ul/li[1]/div[2]/a
경제의 3번째 뉴스 : //*[@id="main_content"]/div/div[2]/div[1]/div[3]/div[2]/ul/li[1]/div[2]/a
경제의 4번째 뉴스 : //*[@id="main_content"]/div/div[2]/div[1]/div[4]/div[2]/ul/li[1]/div[2]/a
사진 없는 경제 뉴스: //*[@id="main_content"]/div/div[2]/div[1]/div[5]/div[2]/ul/li[2]/div/a


~
세계의 1번째 뉴스 : //*[@id="main_content"]/div/div[2]/div[1]/div[1]/div[2]/ul/li[1]/div[2]/a
'''