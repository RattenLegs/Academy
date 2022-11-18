from selenium import webdriver
from selenium.webdriver.common.by import By
import time as t
from bs4 import BeautifulSoup
from datetime import datetime
import codecs


d = datetime.today()

file_path = f'C:/Users/user/Desktop/LKM/python/crawling/알라딘 베스트셀러 1~50위_{d.year}_{d.month}_{d.day}.txt'

'''
- with문을 사용하면 with 블록을 벗어나는 순간
객체가 자동으로 해제됩니다. (자바의 try-with-resource와 비슷)

- with 작성 시 사용할 객체의 이름을 as 뒤에 작성해줍니다.
'''

'''
* 표준 모듈 codecs

- 웹이나 다른 프로그램의 텍스트 데이터와
파이썬 내부의 텍스트 데이터의 인코딩 방식이 서로 다를 경우에
내장함수 open()이 제대로 인코딩을 적용할 수 없어서
에러가 발생합니다. (UnicodeEncodeError)

- 파일 입/출력 시 인코딩 코덱을 변경하고 싶다면
codecs 모듈을 사용합니다.
'''

with codecs.open(file_path, mode='w', encoding='utf-8') as f:
    driver = webdriver.Chrome('C:/Users/user/Desktop/LKM/python/chromedriver.exe')
    driver.get('https://www.aladin.co.kr/shop/common/wbest.aspx?BranchType=1')
    # 이 시점에 1위 페이지는 들어갔으니 신경 안써도 됨

    rank = 1 # 순위 표시

    for n in range(3, 11):
        src = driver.page_source # 소스코드 전부 끌고오자

        soup = BeautifulSoup(src, 'html.parser') # bs 객체 생성

        div_list = soup.find_all('div', class_='ss_book_box')
        
    
        for div in div_list:
            book_info = div.find_all('li')

            if book_info[0].find('span', class_='ss_ht1') == None:
                print('증정품 없음!')
                book_title = book_info[0].text
                book_author = book_info[1].text
                book_price = book_info[2].text
            else:
                print(f'{rank}위 증정품 있음!')
                book_title = book_info[1].text
                book_author = book_info[2].text
                book_price = book_info[3].text

            auth_info = book_author.split(' | ')

            f.write(f'# 순위: {rank}위 \n')
            f.write(f'# 제목: {book_title} \n')
            f.write(f'# 저자: {auth_info[0]} \n')
            f.write(f'# 출판사: {auth_info[1]} \n')
            f.write(f'# 출판일: {auth_info[2]} \n')
            f.write('# 가격:' + book_price.split(', ')[0] + '\n')
            f.write(('-' * 40 + '\n'))
            rank += 1

        # 한 페이지의 크롤링이 완료된 후
        if n == 10:
            break

        best_tab = f'//*[@id="newbg_body"]/div[3]/ul/li[{n}]/a'
        driver.find_element(By.XPATH, best_tab).click()

        t.sleep(1)

