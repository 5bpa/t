# tmux

실행하기

```
tmux
```

세션 목록 보기

```
tmux ls
```

세션으로 다시 접속

```
tmux a -t <세션 이름>
```

# shortcuts

* prefix = `Ctrl+B`

## 일반

* `<prefix> + d` : Detach tmux
* `PageUp` : copy mode, 스크롤 가능.

## Pane 관리

* `<prefix> + "` 또는 `<prefix> + -` : 아래로 팬 추가
* `<prefix> + %` 또는 `<prefix> + |` : 오른쪽에 팬 추가
* `<prefix> + hjkl` : vi 바인딩으로 팬 사이를 이동
* `<prefix> + <방향키>` : 방향키로 팬 사이를 이동
* `<ctrl> + hjkl` : vi 바인딩으로 팬 사이를 이동
* `<prefix> + +`: 모든 팬에서 동기화 입력 시작
* `<prefix> + =`: 모든 팬에서 동기화 입력 종료
* `<prefix> + z`: 현재 팬을 최대화/최소화 토글

## Window 관리

* `<prefix> + c` : 윈도우 새로 생성
* `<prefix> + w` : 윈도우 목록 보기
* `F1 ~ F10`: 윈도우 1~10번 까지로 바로 이동

