
a = 3
b = a
print(a, b)

a = 5
print(a, b)

print("-"* 40)

list1 = [1,2,3]
list2 = list1

print(list1)
print(list2)

list1[0] = 6
list2[1] = 9

print(list1)
print(list2)

# 파이썬도 변수 하나 당 하나의 값만 가짐
# 자바의 스택과 힙 영역을 파이썬도 똑같이 사용하고 있다
# 변수는 기본적으로 스택 영역에 저장이 됨
# 리스트는 힙 영역에 있고, 주소값을 스택 영역에...
# 실제 list1이 가지고 있는 값은 [1,2,3]의 주소값
# 그걸 건네줌...
# list1과 list2는 서로 같은 객체를 쳐다보고 있음
# 자바의 배열도 마찬가지

print('-'* 40)

print('list1의 주소값: ', id(list1))
print('list1의 주소값: ', id(list2))

print('-'* 40)

list1 = [1,2,3]
list2 = []
list2 = list1.copy() # 리스트 내부 요소들을 복사하여 전달

list1[0] = 6
list2[1] = 9

print(list1)
print(list2)

print('list1의 주소값: ', id(list1))
print('list1의 주소값: ', id(list2))