'''
* 연습 - n개의 정수를 전달받아 가장 큰 숫자를 찾아서
 리턴하는 함수를 작성 하세요. (get_max)
 사용자에게 map()를 사용해서 여러 개의 값을 하나의 input()으로
 입력 받은 후 get_max()에게 전달해서 가장 큰 값을 리턴받으세요.
 입력받을 값은 5개로 하겠습니다.
'''

def get_max(*nums):
    max = nums[0]

    for n in nums:
        if n > max:
            max = n
    return max

n1, n2, n3, n4, n5 = map(int, input('정수 5개: ').split())
print('최대값: ', get_max(n1, n2, n3, n4, n5))