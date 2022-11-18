
'''
* 사용자의 입력을 파일(xxx.txt)에 저장하는 프로그램을 작성하세요.
(단, 프로그램을 다시 실행하더라도 파일명이 동일하다면
기존 작성한 내용을 그대로 유지하고
새로 입력된 내용이 추가되어야 합니다.
파일명도 마지막에 입력받아서 생성하세요.)
'''
import traceback as trace

try:
    f = open('C:/Users/user/Desktop/LKM/python/test/points.txt', 'r')
    numlist = f.read().split()
    print('파일 로드 성공!')
except:
    print('파일 로드 실패!')
    print(trace.format_exc()) # 자바의 printStackTrace
finally:
    f.close()

sum = 0
for num in numlist:
    score = int(num)
    sum += score

avg = sum / len(numlist)

try:
    f = open('C:/Users/user/Desktop/LKM/python/test/result.txt', 'w')
    data = f'총점: {sum}점, 평균: {avg: 0.2f}점'
    f.write(data)
    print('파일 저장이 완료되었습니다.')
except:
    print('파일 저장 실패!')
finally:
    f.close()