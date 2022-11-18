
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import time
from datetime import datetime
from bs4 import BeautifulSoup

# 이미지를 바이트로 변환할 수 있는 처리 모듈
from io import BytesIO

# 엑셀 처리 모듈 임포트
import xlsxwriter

# user-agent 정보를 변환해주는 모듈 임포트
# 특정 브라우저로 크롤링을 진행할 때 차단되는 것을 방지
from fake_useragent import UserAgent

# 요청 헤더 정보를 꺼내올 수 있는 모듈
import urllib.request as req

d = datetime.today() # 오늘 날짜, 시간정보 얻어옴

file_path = f'C:/Users/user/Desktop/LKM/python/crawling/알라딘 베스트셀러 1~400위(엑셀)_{d.year}_{d.month}_{d.day}.xlsx'

# User Agent 정보 변환 (필수는 아니에요.)
opener = req.build_opener() # 요청 헤더 정보 초기화
# ie, opera, chrome, firefox, safari, random
opener.addheaders = [('User-agent', UserAgent().random)]
req.install_opener(opener) # 새로운 헤더 정보 삽입

# 엑셀 처리 선언
# Workbook 객체 생성하여 엑셀 파일을 하나 생성(매개값으로 저장될 경로 지정)
workbook = xlsxwriter.Workbook(file_path)

# 워크시트 생성
worksheet = workbook.add_worksheet()

# 브라우저 안뜨게 하기
chrome_option = Options()
chrome_option.add_argument('--headless')

# 브라우저 설정 - 일반 모드
# driver = webdriver.Chrome('C:/Users/user/Desktop/LKM/python/chromedriver.exe')

# 브라우저 설정 - headless 모드
driver = webdriver.Chrome('C:/Users/user/Desktop/LKM/python/chromedriver.exe', options=chrome_option)

# 브라우저 사이즈 조정
driver.set_window_size(800, 600)

# 브라우저 내부 대기
# time.sleep(10) -> 브라우저 로딩에 상관없이 무조건 10초 대기

# 웹 페이지 전체가 로딩될때까지 대기 후 남은 시간 무시
driver.implicitly_wait(10)

# 페이지 이동(베스트 셀러 페이지)
driver.get('https://www.aladin.co.kr/shop/common/wbest.aspx?BranchType=1')

# 엑셀에 텍스트를 저장하기 위해 미리 컬럼 세팅
cell_format = workbook.add_format({'bold':True, 'font_color':'red', 'bg_color':'yellow'})
worksheet.write('A1', '썸네일', cell_format)
worksheet.write('B1', '제목', cell_format)
worksheet.write('C1', '작가', cell_format)
worksheet.write('D1', '출판사', cell_format)
worksheet.write('E1', '출판일', cell_format)
worksheet.write('F1', '가격', cell_format)
worksheet.write('G1', '링크', cell_format)

cur_page_num = 2 # 현재 페이지 번호 (XPATH 활용)
target_page_num = 9 # 목적지 페이지 번호 (XPATH 활용)
rank = 1 # 순위
cnt = 2 # 엑셀 행 수 카운트해줄 변수

worksheet.set_column('A:G', 25)


while True:
    # bs4 초기화
    soup = BeautifulSoup(driver.page_source, 'html.parser')

    div_ss_book_box_list = soup.find_all('div', class_='ss_book_box')

    for div_ss_book_box in div_ss_book_box_list:

        # 이미지
        img_url = div_ss_book_box.select_one('table div > a img.i_cover')
        if img_url == None:
            img_url = div_ss_book_box.select_one('table div > a img.front_cover')
        print(img_url)

        # 타이틀, 작가, 가격 정보를 모두 포함하는 ul부터 지목
        ul = div_ss_book_box.select_one('div.ss_book_list > ul')

        # 타이틀
        title = ul.select_one('li > a.bo3')

        # 작가
        author = title.find_parent().find_next_sibling()

        # 작가쪽 영역 데이터 상세 분해
        author_data = author.text.split(' | ')
        author_name = author_data[0].strip()
        company = author_data[1].strip()
        pub_day = author_data[2].strip()

        # 가격
        price = author.find_next_sibling()
        price_data = price.text.split(', ')[0]

        # 책 상세 정보 페이지 링크
        # title이란 변수에 a태그를 이미 지목해 놓은 상태
        # title -> a태그의 요소 전부를 가지고 있는 상태
        # href로 작성된 키를 전달하고 해당 value를 받아 변수에 저장
        page_link = title['href']

        try:
            # 이미지 바이트 변환 처리
            # BytesIO 객체의 매개값으로 아까 준비해 놓은 img 태그의 src값을 전달
            img_data = BytesIO(req.urlopen(img_url['src']).read())
            # img_url이라는 img태그에서 src 속성을 뽑아주세요!
            # 블라블라~ (찾아서 적기)
            
            # 엑셀에 이미지 저장
            # worksheet.insert_image('배치할 셀 번호', 이미지 제목, {'image_data': 바이트로 변환한 이미지, 기타 속성...})
            worksheet.insert_image(f'A{cnt}', img_url['src'], {'image_data':img_data, 'x_scale':0.5, 'y-scale':0.5})
        except:
            # 파이썬에서는 블록구조에 아무것도 쓰지 않으면 에러라서
            # 딱히 작성할 코드가 없을때 pass 사용
            pass

        # 엑셀에 나머지 텍스트 저장
        worksheet.write(f'B{cnt}', title.text)
        worksheet.write(f'C{cnt}', author_name)
        worksheet.write(f'D{cnt}', company)
        worksheet.write(f'E{cnt}', pub_day)
        worksheet.write(f'F{cnt}', price_data)
        worksheet.write(f'G{cnt}', page_link)

        worksheet.set_row(cnt-1, 75)

        cnt += 1
        rank += 1

    # 한 페이지 크롤링 종료 후
    # 다음 페이지(탭)로 전환
    cur_page_num += 1
    driver.find_element(By.XPATH, f'//*[@id="newbg_body"]/div[3]/ul/li[{cur_page_num}]/a').click()
    del(soup)
    time.sleep(3)

    if cur_page_num > target_page_num:
        print('크롤링 종료!')
        break # while True break

driver.close()
workbook.close()