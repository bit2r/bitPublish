# bitPublish

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


