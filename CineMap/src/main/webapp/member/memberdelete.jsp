<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pack.member.MemberManager"%>
<%@ page import="pack.member.MemberDto"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
    String id = (String) session.getAttribute("idKey");
    MemberDto memberDto = null;

    if (id != null) {
        MemberManager manager = new MemberManager();
        memberDto = manager.getMemberInfo(id);
        request.setAttribute("memberDto", memberDto);
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
    <div class="container">
        <div class="delete-account">
            <h2>회원 탈퇴</h2>
            <form action="memberdeleteproc.jsp" method="post">
                <!-- 아이디는 수정 불가, 읽기 전용 -->
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" value="<%= memberDto.getId() %>" readonly>

                <!-- 비밀번호 입력란 -->
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required>

                <div class="button-group">
                    <button type="submit">회원탈퇴</button>
                    <button type="button" class="cancel-button" onclick="window.location.href='mypage.jsp'">취소</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
