# 리소스 종류: rendom_pet 
# 리소스명: name
# 리소스 링크: https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet
#    - 위 링크의 schema에서 keepers에 대한 명세를 확인할 수 있음
#    - 위 링크의 Read-only에서 random_pet.name을 읽는 방법을 알려줌: random_pet.name.id

resource "random_pet" "name" {
    keepers= {
        # timestamp()가 변경될 때 마다 새로운 random_pet.name이 생성된다
        ami_id = timestamp()
    }
}



# #var은 변수를 나타내는데 variable.tf 등 다른 파일에서 정의해야 함
# 리소스 링크: https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password
# - 위 링크의 Read-only에서 random_password.password를 읽는 법 알려줌: random_password.password.result
resource "random_password" "password" {
    length  =   var.isDB ? 16 : 10 # 참이면 16 거짓이면 10
    special =   var.isDB ? true : false # 참이면 특수문자 사용, 아니면 사용하지 않음
    override_special    = "!#$%*?" # 사용할 특수문자 목록
}