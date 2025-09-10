# Ansible RHCE Practice📝

📖 프로젝트 개요
Red Hat Certified Engineer (RHCE) 시험의 핵심 주제들을 Ansible을 활용해 자동화한 실습 코드입니다. 리눅스 시스템 관리의 다양한 작업을 플레이북으로 구현하고, Git을 통해 효과적으로 관리하는 방법 정리했습니다.

이 저장소에는 다음과 같은 실습 내용이 포함되어 있습니다.

+ 기본 환경 설정: 인벤토리 및 ansible.cfg 파일 구성

+ 패키지 및 서비스 관리: 웹 서버(httpd), FTP 서버(vsftpd), 데이터베이스(MariaDB) 설치 및 설정

+ 파일 및 콘텐츠 관리: 정적/동적 파일 배포, hosts 파일 및 하드웨어 보고서 생성

+ 고급 기능 활용: ansible-vault를 사용한 비밀번호 암호화, RHEL 시스템 역할을 활용한 시간 동기화

+ 스토리지 관리: LVM(Logical Volume Management) 구성 및 사용

+ 작업 제어: when 조건문, loop 구문, block/rescue/always를 활용한 오류 처리

## 🚀 프로젝트 기술 스택

📂 주요 디렉터리 및 파일
```
project/
├── adhoc.sh                  # 애드혹 명령어 스크립트
├── ansible.cfg               # Ansible 전역 설정
├── collections/              # Ansible Galaxy 컬렉션 설치 경로
├── cronjob.yml               # cron 작업 자동화 플레이북
├── files/                    # 정적 파일 (htpasswd, .htaccess 등)
├── group_vars/               # 그룹별 변수 파일
├── hosts                     # 인벤토리 파일
├── hwreport/                 # fetch 모듈로 수집된 보고서
├── lv.yml                    # LVM 생성 플레이북
├── lv2.yml                   # RHEL 스토리지 역할 활용 플레이북
├── packages.yml              # 패키지 설치 플레이북
├── playbook.yml              # 모든 플레이북을 실행하는 종합 플레이북
├── roles/                    # 재사용 가능한 역할(role) 디렉터리
├── secret.txt                # Ansible Vault 암호 파일
├── time_sync2.yml            # 시간 동기화 플레이북
├── userlist.yml              # 사용자 목록 파일
├── users.yml                 # 사용자 계정 생성 플레이북
├── webservers.yml            # 웹 서버 구성 플레이북
├── webcontent.yml            # 웹 콘텐츠 디렉터리 생성 플레이북
└── ... (기타 파일)
```
## ▶️ 종합 플레이북 실행
이 프로젝트의 모든 실습 내용을 한 번에 순차적으로 실행할 수 있는 playbook.yml이 준비되어 있습니다.

YAML
```yaml
---
- name: 1. 종합문제
  hosts: all
  tasks:
    - name: 시작 메시지
      ansible.builtin.debug:
        msg: "[ OK ] 종합문제"

- name: 3) 패키지 설치
  ansible.builtin.import_playbook: packages.yml
# ... (중략) ...
- name: 17) 정기적인 잡 수행
  ansible.builtin.import_playbook: cronjob.yml
```  
## ⚙️ 환경 설정 및 실행 방법
SSH 키 등록: GitHub에 SSH 공개 키를 등록하여 비밀번호 입력 없이 git 명령어를 사용할 수 있도록 설정합니다.

클론: git clone git@github.com:FakePhDKo/kmsweb.git 명령어를 사용해 저장소를 복제합니다.

플레이북 실행:

Bash
```bash
cd kmsweb
ansible-playbook playbook.yml --ask-vault-password
--ask-vault-password 옵션은 pw.yml과 같이 암호화된 파일에 접근하기 위해 필요합니다.
```
