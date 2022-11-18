'''
* points.txt 파일의 숫자값을 모두 읽어서
총합과 평균을 구한 뒤
총점, 평균값을 result.txt라는 파일에
쓰는 프로그램을 작성해 보세요.
'''

# 1. 읽어오기(문자열을 숫자로 변환)
try:
    f = open('C:/Users/user/Desktop/LKM/python/test/points.txt', 'r')
    text = f.read().split()
    print(text)
except:
    print('파일 로드 실패')
finally:
    f.close()

# 2. 총점/평균

# 3. result.txt 파일에 씀