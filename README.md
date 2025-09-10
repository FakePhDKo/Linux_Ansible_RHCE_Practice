Ansible RHCE Practice
📖 프로젝트 개요
이 프로젝트는 Red Hat Certified Engineer (RHCE) 시험의 핵심 주제들을 Ansible을 활용해 자동화한 실습 코드 저장소입니다. 리눅스 시스템 관리의 다양한 작업을 플레이북으로 구현하고, Git을 통해 효과적으로 관리하는 방법을 익힙니다.

이 저장소에는 다음과 같은 실습 내용이 포함되어 있습니다.

기본 환경 설정: 인벤토리 및 ansible.cfg 파일 구성

패키지 및 서비스 관리: 웹 서버(httpd), FTP 서버(vsftpd), 데이터베이스(MariaDB) 설치 및 설정

파일 및 콘텐츠 관리: 정적/동적 파일 배포, hosts 파일 및 하드웨어 보고서 생성

고급 기능 활용: ansible-vault를 사용한 비밀번호 암호화, RHEL 시스템 역할을 활용한 시간 동기화

스토리지 관리: LVM(Logical Volume Management) 구성 및 사용

작업 제어: when 조건문, loop 구문, block/rescue/always를 활용한 오류 처리

📂 주요 디렉터리 및 파일
ansible.cfg: Ansible의 전역 설정 파일. 인벤토리 및 역할 경로 지정.

inventory: 관리 대상 호스트 목록과 그룹을 정의하는 인벤토리 파일.

roles/: 재사용 가능한 작업 단위인 Ansible 역할들이 저장된 디렉터리.

collections/: ansible-galaxy로 설치된 컬렉션들이 저장된 디렉터리.

hwreport/: fetch 모듈로 수집한 하드웨어 보고서 결과 파일이 저장된 디렉터리.

▶️ 종합 플레이북 실행
이 프로젝트의 모든 실습 내용을 한 번에 순차적으로 실행할 수 있는 playbook.yml이 준비되어 있습니다. import_playbook 모듈을 사용해 각 기능별 플레이북을 유기적으로 연결합니다.

YAML

---
- name: 1. 종합문제
  hosts: all
  tasks:
    - name: 시작 메시지
      ansible.builtin.debug:
        msg: "[ OK ] 종합문제"

- name: 3) 패키지 설치
  ansible.builtin.import_playbook: packages.yml

- name: 4) 레드헷 시스템 역할 사용
  ansible.builtin.import_playbook: time_sync2.yml

- name: 6) 웹 서버 구성 및 확인
  ansible.builtin.import_playbook: webservers.yml

- name: 7) 역할 생성 및 사용
  ansible.builtin.import_playbook: newrole.yml

- name: 8) 논리 볼륨 생성 및 사용
  ansible.builtin.import_playbook: lv.yml

- name: 9) 호스트 파일 생성
  ansible.builtin.import_playbook: hosts.yml

- name: 10) 파일 콘텐츠 수정
  ansible.builtin.import_playbook: issue.yml

- name: 11) 웹 콘텐츠 디렉토리 생성
  ansible.builtin.import_playbook: webcontent.yml

- name: 12) 하드웨어 보고서 생성
  ansible.builtin.import_playbook: hwreport.yml

- name: 14) 사용자 계정 생성
  ansible.builtin.import_playbook: users.yml

- name: 15) FTP 서버 구성
  ansible.builtin.import_playbook: ftp.yml

- name: 16) 시스템 런레벨 변경
  ansible.builtin.import_playbook: target.yml

- name: 17) 정기적인 잡 수행
  ansible.builtin.import_playbook: cronjob.yml
⚙️ 환경 설정 및 실행 방법
SSH 키 등록: GitHub에 SSH 공개 키를 등록하여 비밀번호 입력 없이 git 명령어를 사용할 수 있도록 설정합니다.

클론: git clone git@github.com:FakePhDKo/kmsweb.git 명령어를 사용해 저장소를 복제합니다.

플레이북 실행:

Bash

cd kmsweb
ansible-playbook playbook.yml --ask-vault-password
--ask-vault-password 옵션은 pw.yml과 같이 암호화된 파일에 접근하기 위해 필요합니다.
