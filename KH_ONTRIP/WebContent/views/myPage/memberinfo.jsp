<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%
    String contextPath = request.getContextPath();
%>
<% 
	Member loginUser = (Member) session.getAttribute("loginUser");
	// 로그인전 or 로그인 실패 : null
	// 로그인 성공후 : 로그인한 회원의 정보가 담긴 member객체.
	
	String alertMsg = (String) session.getAttribute("alertMsg");
	// 서비스 요청전 : null
	// 서비스 요청성공후 : alert로 띄워줄 메시지 문구.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 회원정보</title>

<!-- 폰트적용  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/css/mainForm.css" rel="stylesheet" >

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

<!-- BootStrap 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<!-- Alert 창  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
    .outer1{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 1000px;
        height: 800px;
        /* border: 1px solid black; */
        margin: auto;
        box-sizing: border-box;
        text-align: center;
        box-shadow:0 0 10px 1px rgb(230, 150, 52);
    }
    #num1 , #num2 , #num3 , #num4{
        border-bottom: 1px solid #adadad;
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
        outline:none;
        border-top: 0;
        border-left: 0;
        border-right: 0;
    }
    #updateName , #updatePhoneNumber{
        margin: 10px;
        padding: 10px 0px;
        width: 100%;
    }
    #btn1 , #btn2{
        width: 100px;
    }
    .uk-flex-middle {
        align-items: center;
    }
    .uk-flex-center {
        justify-content: center;
    }
    .uk-flex {
        display: flex;
    }
    .uk-background-cover {
        background-size: cover;
    }
    .uk-background-contain{
        background-position: 50% 50%;
        background-repeat: no-repeat;
    }
    .uk-section-default {
        background: rgb(250, 250, 250);
    }

    .uk-section {
        padding-top: 70px;
        padding-bottom: 70px;
    }
    .uk-section {
        display: flow-root;
        box-sizing: border-box;
    }
    .sl-in2 {
	  animation: change1 1s ease forwards;
	}
	
	@keyframes change1 {
	  from {
	    transform: translateY(30%);
	  }
	
	  to {
	    transform: translateY(0%);
	  }
	}
	tr>td:nth-child(1) {
		font-weight:900;
		font-size: 16px;
	}
	.btn-pwd:hover{
		font-weight:900;
	}
    
</style>
</head>
<body>

	<%@ include file="../common/mypageNewNavbar.jsp" %>
	<br><br><br><br> 
    <%
        String userName = loginUser.getMemberName();
    	String userGender = loginUser.getGender() == null ? "" : loginUser.getGender();
    	String userId = loginUser.getMemberId() == null ? "" : loginUser.getMemberId();
    	String userPhoneNumber = loginUser.getPhone() == null ? "" : loginUser.getPhone();
    	String userBirth = loginUser.getBirthDate() == null ? "" : loginUser.getBirthDate();
    	Date userEnrollDate = loginUser.getEnrollDate();
	%>
	
	<div class="uk-section uk-section-default" style="min-width: 90vw; height:28vh;">
        <div class="uk-container">
            <div style="text-align: center; margin-top : -1.5%;">
                <div style="font-size:40px; font-weight:600;">OnTrip</div><br>
                <div style="color:darkgray">MAKE YOUR ROUTE OPTIMIZED</div> <br><br>
                <div>
                	<span>회원정보</span> > <span style="color: coral; font-size:16px; font-weight:600;">회원정보수정</span>
                </div>
            </div>
        </div>
    </div>
	
	<br><br><br>
	
    <div class="outer1 sl-in2">
        <br><br><br><br><br><br>
        
        <h1 style = "text-align : center; font-size:40px; margin-top:-30px;">여행자 정보</h1>
        <br><br><br>
        
        <form id="myMemberUpdate" action="<%=request.getContextPath()%>/update.me" method="post">
            <div align="center">
            	<table align = center>
                <tr>
                    <td>여행자 이름 :&nbsp;</td>
                    <td><input type = "text" id="updateName" name = "userName" value = "<%=userName %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>성별 :&nbsp;</td>
                    <td><input type = "text" id="num1" name = "userGender" value = "<%=userGender %>" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td>아이디 :&nbsp;</td>
                    <td><input type = "text" id="num2" name = "userId" value = "<%=userId %>" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td>휴대폰 번호 :&nbsp;</td>
                    <td><input type = "text" id="updatePhoneNumber" name = "userPhoneNumber" value = "<%=userPhoneNumber %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>생년월일 :&nbsp;</td>
                    <td><input type = "text" id="num3" name = "userBirth" value = "<%=userBirth %>" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td>가입한 날짜 :&nbsp;</td>
                    <td><input type = "text"  id="num4" name = "userEnrollDate" value = "<%=userEnrollDate %>" readonly></td>
                    <td></td>
                </tr>
            </table>
            </div>
            <br><br>
            <div align = "center">
                <button type = "button" id="btn1" class = "btn btn-secondary btn-sm btn-10" onclick="return newMemberUpdate();"
                	style="font-size:17px; width:150px; height:40px;">정보 변경</button> &nbsp;&nbsp;&nbsp;<br><br>
                <button type = "button" id="btn2" class = "btn btn-secondary btn-sm btn-pwd" onclick="myPwdUpdate();"
                	style="font-size:15px; width:150px; height:40px; border:none;
                	 background-color:white; color:black; margin-left:-10px;">비밀번호 변경</button>
            </div>
        </form>
    </div>
            <br><br><br>

    <script>

	    function newMemberUpdate(){
	    	
	        	
	        	Swal.fire({
	                title: '회원정보를 변경하시겠습니까?',
	                icon: 'warning',
	                showCancelButton: true,
	                confirmButtonColor: '#3085d6',
	                cancelButtonColor: '#d33',
	                confirmButtonText: '변경',
	                cancelButtonText: '취소'
	            }).then((result) => {
	                if (result.isConfirmed) {
	                    Swal.fire({
	                    		title: '변경이 완료되었습니다.',
	                    		icon:'success',
	                    		customClass: {
	                    		    confirmButton: 'swal2-confirm swal2-styled swal2-jong',
	                    		    cancelButton: 'btn btn-danger'
	          		  },		
	                    }).then((result) => {
	                    	if(result.isConfirmed){
			            		$("#myMemberUpdate").submit();
	                    		
	                    	}  		                        	
	                    });
	                }
	            });
	           	
		
	    } 

        function myPwdUpdate(){
        	location.href = "<%=request.getContextPath()%>/newpwd.me";
        }
    </script>

</body>
</html>