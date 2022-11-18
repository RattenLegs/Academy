from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import time
from datetime import datetime
from bs4 import BeautifulSoup
from io import BytesIO
import xlsxwriter
from fake_useragent import UserAgent
import urllib.request as req

d = datetime.today()

file_path = f'C:/Users/user/Desktop/LKM/python/crawling/멜론일간차트순위 1~100위_{d.year}_{d.month}_{d.day}.xlsx'

opener = req.build_opener()
opener.addheaders = [('User-agent', UserAgent().random)]
req.install_opener(opener)

workbook = xlsxwriter.Workbook(file_path)

worksheet = workbook.add_worksheet()

browser = webdriver.Chrome('C:/Users/user/Desktop/LKM/python/chromedriver.exe')

browser.set_window_size(1280, 1024)

browser.get('https://www.melon.com/chart/day/index.htm')

browser.implicitly_wait(5)

worksheet.set_default_row(50)
worksheet.set_column('A:E', 25)

cell_format = workbook.add_format({'bold':True, 'font_color':'red', 'bg_color':'yellow', 'border':1})
worksheet.write('A1', '순위', cell_format)
worksheet.write('B1', '커버사진', cell_format)
worksheet.write('C1', '가수이름', cell_format)
worksheet.write('D1', '출판사', cell_format)
worksheet.write('E1', '출판일', cell_format)

row_cnt = 2

soup = BeautifulSoup(browser.page_source, 'html.parser')

for cnt in [50,100]:
    song_tr_list = soup.select(f'#lst{cnt}')

    for song_tr in song_tr_list:

        # 순위 찾기
        rank = song_tr.select_one('div.wrap.t_center').text.strip() # 입력값이 div class ="wrap t_center"와 같음
        print('순위' + rank)

        # 이미지 찾기
        img_tag = song_tr.select_one('div.wrap > a > img')
        img_url = img_tag['src']
        print('이미지:', img_url)

        # 가수 이름
        artist_name = song_tr.select_one('div.wrap div.ellipsis.rank02 > a').text.strip()
        print('가수이름:', artist_name)

        # 앨범명 찾기
        album_name = song_tr.select_one('div.wrap div.ellipsis.rank03 > a').text.strip()
        print(album_name)

        # 노래명 찾기
        song_name = song_tr.select_one('div.wrap div.ellipsis.rank01 > span > a').text.strip()
        print(song_name)

        print('=' * 40)

        try:
            img_data = BytesIO(req.urlopen(img_url).read())
            worksheet.insert_image(f'B{row_cnt}', img_url, {'image_data': img_data})
        except:
            pass

        worksheet.write(f'A{row_cnt}', rank)
        worksheet.write(f'C{row_cnt}', artist_name)
        worksheet.write(f'D{row_cnt}', album_name)
        worksheet.write(f'E{row_cnt}', song_name)

        row_cnt += 1


workbook.close()
browser.close()