<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <title>TO DO register</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>할 일 등록</h1><br>
  <form class="form" action="TodoAddServlet" method="post" accept-charset="utf-8">
      <div class="myform">
        어떤 일인가요?<br>
        <input type="text" name="what" maxlength="24" placeholder="ex)데이터베이스 과제하기"><br><br>
        누가 할 일인가요?<br>
        <input type="text" name="who" maxlength="24" placeholder="ex)홍길동">
        <br><br>우선순위를 선택하세요.<br>
      </div>
      <div class="form-radio">
        <input type="radio" class="input-radio" name="radio" value="1">1순위
        <input type="radio" class="input-radio" name="radio" value="2">2순위
        <input type="radio" class="input-radio" name="radio" value="3">3순위
      </div><br><br>
      <span class="finalinput">
        <a href="MainServlet">◀이전</a>
        <input type="submit">
        <input type="reset" value="내용 지우기">
      </span>
  </form>
</body>
</html>
