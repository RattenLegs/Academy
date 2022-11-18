
'''
* 표준 모듈 time

- time 모듈은 시간 관련 기능들을 제공합니다.

- 대표적인 함수는 time()인데, 이 함수는
1970년 1월 1일 자정을 기준으로 현재까지 경과한
시간을 초단위로 표현한 유닉스 시간을 반환합니다.
'''
import time
print(time.time())

# time 함수를 이용한 프로그램 속도 측정 테스트
start = time.time()
print(start)

sum = 0
for n in range(5000000):
    sum += n

end = time.time()
print(end)

print(f'프로그램 실행 속도: {end-start: 0.4f}초')

'''
- time 모듈의 sleep() 함수는 cpu를 지정한 시간만큼 잠재워
아무것도 하지 않고 시간을 끌게 한다.
'''

print("문제")
time.sleep(3)
print("대학생이힘센이유")
time.sleep(15)
print("개강하니까")
time.sleep(3)
print("아")