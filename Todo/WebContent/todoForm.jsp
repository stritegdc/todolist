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
  <h1>�� �� ���</h1><br>
  <form class="form" action="TodoAddServlet" method="post" accept-charset="utf-8">
      <div class="myform">
        � ���ΰ���?<br>
        <input type="text" name="what" maxlength="24" placeholder="ex)�����ͺ��̽� �����ϱ�"><br><br>
        ���� �� ���ΰ���?<br>
        <input type="text" name="who" maxlength="24" placeholder="ex)ȫ�浿">
        <br><br>�켱������ �����ϼ���.<br>
      </div>
      <div class="form-radio">
        <input type="radio" class="input-radio" name="radio" value="1">1����
        <input type="radio" class="input-radio" name="radio" value="2">2����
        <input type="radio" class="input-radio" name="radio" value="3">3����
      </div><br><br>
      <span class="finalinput">
        <a href="MainServlet">������</a>
        <input type="submit">
        <input type="reset" value="���� �����">
      </span>
  </form>
</body>
</html>
