# bitPublish <img src="hexlogo/bitPublish_logo.png" align="right" height="120" width="120"/>

XeLaTeX 기반으로 한글 책을 PDF 파일로 조판할 수 있는 `Quarto extension`입니다.

## 새 문서 또는 프로젝트 만들기

`bitPublish`를 템플리트로 사용하여 한글 책을 조판할 수 있습니다.

다음 명령은 extension이 설치되고, 책의 시작 위치에 사용할 수 있는 예제 qmd 파일 및 bibiography(참고 문헌)이 생성됩니다.

```
quarto use template bit2r/bitPublish
```

## 기존 문서에 extension 설치하기

템플릿 파일을 설치하지 않고 기존 `Quarto` 프로젝트에서 `bitPublish` extension만 사용하려면 다음 명령을 수행합니다. 그러면 `_extensions` 디렉토리만 다운로드합니다.

```
quarto install extension bit2r/bitPublish
```

## 사용하기

### 미리보기

다음 명령은 저술한 책을 브라우저에서 미리보기로 보여줍니다. 추가로 문서를 편집하지 않았다면, 예제 페이지가 브라우저에 나타납니다. 

```
quarto preview --to bitPublish-pdf
```

### 랜더링하기

다음 명령은 저술한 책을 docs 디렉토리에 PDF 파일로 출력합니다. 추가로 문서를 편집하지 않았다면, 예제 페이지가 출력됩니다.

```
quarto render --to bitPublish-pdf
```

## 라이센스

### 소프트웨어 라이센스

bitPublish는 <a href="https://github.com/bit2r/bitPublish/blob/main/LICENSE" target="_blank">GNU General Public License (GPLv2)</a> 라이센스를 따릅니다.

### 저작물 라이센스

bitPublish가 제공하는 예제 등의 저작물은 <a href="https://creativecommons.org/licenses/?lang=ko" target="_blank">CC BY-NC-SA</a> 라이센스를 따릅니다.

![](https://licensebuttons.net/l/by-nc-sa/3.0/88x31.png)

### 폰트 라이센스

bitPublish는 bitPublish에 최적화된 폰트를 내장하여 배포합니다. 그러나 경우에 따라서 사용자가 원하는 폰트로 변경하여 사용이 가능합니다.

bitPublish가 사용하는 폰트는 다음의 라이센스를 따릅니다.

- D2Coding
    - <a href="http://scripts.sil.org/OFL" target="_blank">SIL OFL(Open Font License)</a>
    - [네이버 나눔글꼴 라이선스 안내](https://help.naver.com/service/30016/contents/18088?osType=PC&lang=ko)  
- KoPupWdorld
    - [별도 라이센스](https://www.kopus.org/wp-content/uploads/2021/04/%EC%84%9C%EC%B2%B4_%EB%9D%BC%EC%9D%B4%EC%84%A0%EC%8A%A4.pdf)
- NanumSquare
    - <a href="http://scripts.sil.org/OFL" target="_blank">SIL OFL(Open Font License)</a>
    - [네이버 나눔글꼴 라이선스 안내](https://help.naver.com/service/30016/contents/18088?osType=PC&lang=ko)  
- Nimbus Sans L
    - [GPL](https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt)
    - [LLPL](https://www.latex-project.org/lppl/lppl-1-3c/)
- STIXTwoText
    - <a href="http://scripts.sil.org/OFL" target="_blank">SIL OFL(Open Font License)</a>


## 고마운 분들

bitPublish는 다음 오픈소스 기여자의 리소스를 사용하거나 참조하였습니다.:

- 이재호님
    - <a href="https://github.com/bit2r/bitPublish/pull/44" target="_blank">한글 색인의 오분류 문제 해결 및 초성 타이틀 출력 구현</a>
    - <a href="https://github.com/Zeta611" target="_blank">Github</a>    
- Pawan Mall
    - [CSS3 Blockquote Effects Demos](https://codepen.io/iPawan/pen/emrPKP)
    - 타이틀 박스에 응용
- Jaime
    - [Quotes With Font Awesome And Pseudo Elements](https://codepen.io/jimmycow/pen/LmjVaz)
    - 이야기 박스에 응용

## 도움요청

bitPublish의 발전을 위해서 버그에 대한 리포팅, 기능 개선을 위한 요구사항들은
<a href="https://github.com/bit2r/bitPublish/issues" target="_blank">여기에</a>에 문제를 제기하거나 요청해주세요. 
특히 버그는 최소한의 재현 가능한 예제와 함께 제출바랍니다.

## 기여자 행동 강령

이 프로젝트는
<a href="https://github.com/bit2r/bitPublish/blob/main/CONDUCT.md" target="_blank">Contributor Code of Conduct(기여자 행동 강령)</a>과 함께
릴리스되었습니다. 이 프로젝트에 참여함으로써 귀하는 해당 조건을 준수하는 데 동의하는 것입니다.

