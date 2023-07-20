# TeamPro

각 Region별 prod/stage 내에 main.tf 파일에서 하단 33번 줄 volteon/password 를 본인의 Secrets ㅡanager에 되어있는 암호로 입력하여 저장하면 됩니다.
그리고 AWS Secrets manager가 Region 별로 분리가 되어있기 때문에 Seoul Region 암호에 들어간 상태에서 Virginia Region으로 이동하면 우측 상단에 "암호 복제" 관련 항목이 보일겁니다. 그걸로 복제하면 끝

# 07/20 추가
terraform 으로 eks 프로비저닝에 참고할 자료 업로드

* 참고 링크
https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks
https://developer.hashicorp.com/terraform/tutorials/kubernetes/kubernetes-provider
