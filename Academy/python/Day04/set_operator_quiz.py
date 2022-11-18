
'''
- 서로 다른 정수가 담긴 두 개의 리스트를 비교하여
li 안에 있는 정수가 li2에도 담겨있다면 그 정수를 배제하시고
서로 겹치지 않는 정수만 담긴 새로운 리스트를 생성해 보세요.
'''

li = [1, 2, 3, 4, 5, 6, 7]
li2 = [1, 3, 8, 4, 5, 7, 101]

# 리스트를 집합으로 변경

li_set = set(li)
# print(li_set)

li_set2 = set(li2)
# print(li_set2)

# 겹치지 않는 정수가 담긴 배타적 차집합 선언

# print(li_set ^ li_set2)


# 배타적 차집합을 리스트로 재변경

li_answer = list(li_set ^ li_set2)
# print(li_answer)

# 보기 좋게 정리
li_answer.sort(reverse=False)

# 최종 답안
print(li_answer)