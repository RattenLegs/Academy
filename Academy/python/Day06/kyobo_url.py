from selenium import webdriver
from selenium.webdriver.common.by import By
import time as t
from bs4 import BeautifulSoup
from datetime import datetime
import codecs

d = datetime.today()

file_path = f'C:/Users/user/Desktop/LKM/python/crawling/교보 베스트셀러 1~50위({d.year}년_{d.month}월_{d.day}일.html'

with codecs.open(file_path, mode='w', encoding='utf-8') as f:
    driver = webdriver.Chrome('C:/Users/user/Desktop/LKM/python/chromedriver.exe')
    driver.get('http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?orderClick=d79')
    # 베스트셀러 페이지로 진입

    t.sleep(1.5)

    src = driver.page_source
    soup = BeautifulSoup(src, 'html.parser')

    title_list = soup.find_all('div', class_='title')
    # print(len(title_list))

    rank = 1

    f.write('<!DOCTYPE HTML> \r\n')
    f.write('<html> \r\n')
    f.write('<head> \r\n')
    f.write('<meta charset="UTF-8"> \r\n')
    f.write('<title>교보 베스트셀러 1~50위 \r\n')
    f.write('</head> \r\n')
    f.write('<body> \r\n')

    for idx in range(len(title_list)):
        if idx > 31:
            f.write('<p> \r\n')
            f.write('<b>순위: {rank}위</b><br> \r\n')
            a_url = str(title_list[idx].find('a'))
            f.write(a_url + '\n <hr> \n')
            rank += 1
            f.write('<p> \r\n')

    f.write('</body> \r\n')
    f.write('</html> \r\n')
'''
    for n in range(1, 52):
        driver.find_element(By.XPATH, f'//*[@id="main_contents"]/ul/li[{n}]/div[2]/div[2]/a/strong').click()
        t.sleep(1)
        print(f'{n}위 책입니다')
        driver.back()
'''     
        

'''
역행자: //*[@id="main_contents"]/ul/li[1]/div[2]/div[2]/a
작별인사: //*[@id="main_contents"]/ul/li[2]/div[2]/div[2]/a
50위: //*[@id="main_contents"]/ul/li[50]/div[2]/div[2]/a
//*[@id="main_contents"]/ul/li[1]/div[2]/div[2]/a/strong
//*[@id="main_contents"]/ul/li[50]/div[2]/div[2]/a/strong
'''