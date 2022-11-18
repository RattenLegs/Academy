
'''
* 함수(function)

- 함수는 지속적으로 사용되는 코드 블록에 이름을 붙여넣은 형태

- 함수는 한 번 정의해 두면 지정된 함수 이름을 통해
언제든지 해당 코드 블록을 실행할 수 있습니다.

- 파이썬에서 함수를 정의할 때 사용하는 키워드는 def

- 정의해 놓은 함수를 사용하는 것을 호출(call) 이라고 부릅니다.

- 파이썬에서는 함수를 호출하려면 반드시 호출문보다 상단부에
함수를 먼저 정의해야 합니다.
(자바스크립트는 상관없음)
(자바는 클래스에 메서드가 선언되는데 메서드의 순서가 중요하지 않음)
'''

# 함수의 정의 (1~x까지의 누적합을 구하는 로직)
# function() {} : 자바스크립트
# public void calcData(){}: 자바

def calc_sum(end): 
    # 매개변수: 함수가 필요한 값을 받아서 함수 내부로 전달
    sum = 0
    for n in range(1, end+1):
        sum += n
    return sum

    # return: 함수가 부른 쪽으로 값을 반환한다
    # 반환된 곳이 print 함수 내부이기 때문에 값이 바로 출력
# 함수의 호출
print('1~100까지의 누적합: ', calc_sum(100))

'''
* 인수, 매개변수(arguments)

- 인수는 함수를 호출할 때 함수 실행에 필요한 값들을 전달하는
매개체 역할을 하며, 그렇기 때문에 매개변수(parameter)라고도
부릅니다.

- 인수의 개수는 제한이 없어 많은 값을 함수에 전달할 수도 있고
하나도 전달하지 않을 수 있습니다.
- 자바의 경우 매개변수의 개수가 256개로 정해져 있습니다.
- 파이썬은 제한이 없습니다.

- 파이썬의 경우에는 데이터 타입을 작성하지 않기 때문에
이 함수를 처음 사용하는 사람도 인수 이름만 보고 무슨 값을
전달해야 할 지 의미를 알기 쉽게 지정하는 것이 좋습니다.
'''

'''
* 연습

1. 인수를 정수형태로 시작값(start), 끝값(end)을 입력받아
 반복문으로 start부터 end까지의 누적 총합을 구하는 함수를 정의하세요.

2. 함수 이름은 calc_rangesum으로 정의하세요.
ex) calc_rangesum(3, 7) -> 3부터 7까지의 누적합을 구해와야 함.

3. 출력예시: "x~y까지의 누적합: z"
사용자에게 입력받은 값을 함수로 전달해서 값을 출력해 보세요.
'''


start = int(input('시작값을 입력해주세요'))
end = int(input('종료값을 입력해주세요'))

def calc_rangesum(start, end):
    if start > end:
        start, end = end, start
    total = 0
    for n in range(start, end+1):
        total += n
    return total 
    # 아 return을 안썼구나
    # 그렇다면 무슨 차이?


print(f'{start} ~ {end}까지의 누적합: {calc_rangesum(start, end)}')

'''
* 반환값 (return value)
- 반환값이란 함수를 호출한 곳으로 함수의 최종 실행 결과를
전달하는 값입니다.

- 인수는 여러 개 존재할 수 있지만, 반환값은 언제나
하나만 존재해야 합니다.

- 모든 함수가 반환값이 있는 것은 아닙니다.
함수 실행 후 딱히 반환할 값이 없다면 return을 생략할 수 있습니다.

'''
def add(n1, n2):
    return n1+n2

result = add(10, 5)
# 리턴이 있는 함수는 다른 함수의 매개값으로도 사용이 가능합니다.
print(add(add(5,7), add(9,8))) # add(12, 17)

# n = int(input('정수: ')) -> n = int('3')

def operate_all(n1, n2):
    return n1 + n2, n1 - n2, n1 * n2, n1 / n2 # tuple

print(type(operate_all(10,5)))
    
def multi(n1, n2):
    result = n1 * n2
    print(f'{n1} x {n2} = {result}')

multi(9, 6)
# abc = multi(9,6) : 이렇게하지마세요~~~~~ None나옴
# 왜? 함수가 리턴해준 값이 없었음
# 아씨발 이거 내가 잘못한 그 방법이잖아 ㅋㅋㅋㅋㅋㅋ