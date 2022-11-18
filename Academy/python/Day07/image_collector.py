
print('# 최초 실행 시 약간의 로딩이 발생할 수도 있으니 잠시만 기다려주세요! (최대 1분)')
print('인터넷 연결이 되어 있어야 합니다~!')

# 운영체제에서 제공되는 여러 기능 (폴더 생성)
import os
from selenium import webdriver
from bs4 import BeautifulSoup
import urllib.parse as rep
import urllib.request as req
import time
from fake_useragent import UserAgent

opener = req.build_opener()
opener.addheaders = [('User-agent', UserAgent().random)]
req.install_opener(opener)

# 다음 이미지 기본 URL
base = 'https://search.daum.net/search?w=img&nil_search=btn&DA=NTB&enc=utf8&q='

print('### 검색어를 입력하시면 해당 검색어에 맞는 이미지를 다운로드 받습니다.')
print('### 이미지 자료는 daum 검색 자료를 활용하고, 개수는 첫페이지 기준으로 80개의 이미지를 가져옵니다.')
print('### 다운받은 이미지는 C드라이브 imagedown 폴더에 자동 저장됩니다.')

# 검색어
s = input('### 검색어 입력:')

'''
모든 브라우저에서 모든 서버에게 정확한 요청 데이터를 전달하기 위해
URL Encoding이 필요합니다.
URL에는 아스키 코드를 이용한 문자를 전달하는 것이 정석입니다.
타 언어로 작성된 문자를 변환해서 전달하는 것이 맞습니다.
'''
quote = rep.quote_plus(s)
url = base + s
# print(url)

# 이미지 저장 경로 폴더 만들기
save_path = 'C:/imagedown/'

# 폴더 생성 (예외 처리)
try:
    # 기존 폴더 있는지 체크
    if not os.path.isdir(save_path):
        # 없다면 폴더 생성
        os.mkdir(save_path)
except OSError as e: 
    print('폴더 생성 실패!')
    print('폴더 이름: ', e.filename)

browser = webdriver.Chrome('C:/Users/user/Desktop/LKM/python/chromedriver.exe')
browser.get(url)

browser.implicitly_wait(5)

src = browser.page_source

soup = BeautifulSoup(src, 'html.parser')

img_list = soup.select('div.wrap_thumb > a.link_thumb > img')

# enumerate(컬렉션 자료, start index)
# 리스트, 튜플 등 컬렉션 자료형에서 요소와 순서값(index)를 동시에
# 전달받고 싶을 때 사용하는 내장 함수입니다.
for i, img in enumerate(img_list, 1):
    
    # 저장 파일명 및 경로
    full_file_name = os.path.join(save_path, save_path + str(i) + '.png')

    # 파일명
    print(full_file_name)

    # 다운로드 요청
    req.urlretrieve(img['data-src'], full_file_name)

# 다운 완료
print('download success!')

# 다운로드 완료 이후 다운로드 폴더를 자동으로 열어주는 행위
path = os.path.realpath(save_path)
os.startfile(path)

print('5초 뒤 자동 종료됩니다.')
browser.close()
time.sleep(5)