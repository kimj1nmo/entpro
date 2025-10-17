<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header_user.jsp" %>

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>

<!-- ///// content 시작 ///// -->
<main class="main mainCenter">
  <section class="section sectionMargin">




    <div class="row justify-content-center min-vh-100">

      <div class="col-lg-4">
        <div class="card divHeight1">
          <div class="card-body">

<!-- <div style="text-align : center;"> -->
<!-- <button type="button" onclick='btnClick(this)' class="btn btn-block btn-outline-info btn-flat">e001</button> -->
<!-- <button type="button" onclick='btnClick(this)' class="btn btn-block btn-outline-info btn-flat">f001</button> -->
<!-- <button type="button" onclick='btnClick(this)' class="btn btn-block btn-outline-info btn-flat">skyView1203</button> -->
<!-- <button type="button" onclick='btnClick(this)' class="btn btn-block btn-outline-info btn-flat">minjimin</button></div> -->
            <h5 class="card-title">Login</h5>
            <!-- Vertical Form -->
            <form id="formLogin" class="row g-3" action="/login" method="POST">
              <div class="col-12">
                <label for="inputNanme4" class="form-label">아이디</label>
                <input type="text" class="form-control" id="inputNanme4" name="username"
                  placeholder="아이디" value="e001" required />
              </div>
              <div class="col-12">
                <label for="inputPassword4" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="inputPassword4" name="password"
                  placeholder="비밀번호" value="java" required />
              </div>
              <br><br><br><br><br><br>

              <div class="text-center">
                <button id="loginButton" type="submit" class="btn btn-info rounded-pill loginWidth text-white">로그인</button>
              </div>
            </form><!-- Vertical Form -->
          </div>
        </div>
        <hr>
        <div class="text-center">
          <button type="button" class="btn btn-outline-info rounded-pill mt-3 me-4"
            onclick="location.href='/findId'">아이디 찾기</button>
          <button type="button" class="btn btn-outline-info rounded-pill mt-3 me-4"
            onclick="location.href='/findPw'">비밀번호 찾기</button>
          <button type="button" class="btn btn-outline-info rounded-pill mt-3"
            onclick="location.href='/signup'">회원가입</button>
        </div>
      </div>
<!--       <div style="width:700px; height:500px; border: 1px solid black;"> -->
        <style>
          #deptNm{
            width: 12vh;
          }
        </style>
<!--         <table> -->
<!--           <tr> -->

<!--             <td id="deptNm">직급</td> -->
<!--             <td id="deptNm" style="background-color: FC0;">인사팀</td> -->
<!--             <td id="deptNm" style="background-color: FC0;">재무팀</td> -->
<!--             <td id="deptNm" style="background-color: FC0;">IT팀</td> -->
<!--             <td id="deptNm" style="background-color: FC6;">전략팀</td> -->
<!--             <td id="deptNm" style="background-color: FC6;">시장팀</td> -->
<!--             <td id="deptNm" style="background-color: FC9;">공연팀</td> -->
<!--             <td id="deptNm" style="background-color: FCC;">콘텐츠팀</td> -->
<!--             <td id="deptNm" style="background-color: FCF;">매니지팀</td> -->
<!--           </tr> -->
<!--           <tr> -->
<!--             <td>사원</td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp11</button></td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp17</button></td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp22</button></td> -->
<!--             <td style="background-color: FC6;"><button onclick='btnClick(this)'>emp27</button></td> -->
<!--             <td style="background-color: FC6;"><button onclick='btnClick(this)'>emp32</button></td> -->
<!--             <td style="background-color: FC9;"><button onclick='btnClick(this)'>emp37</button></td> -->
<!--             <td style="background-color: FCC;"><button onclick='btnClick(this)'>emp42</button></td> -->
<!--             <td style="background-color: FCF;"><button onclick='btnClick(this)'>emp47</button></td> -->
<!--           </tr> -->
<!--           <tr> -->
<!--             <td>대리</td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp12</button></td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp18</button></td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp23</button></td> -->
<!--             <td style="background-color: FC6;"><button onclick='btnClick(this)'>emp28</button></td> -->
<!--             <td style="background-color: FC6;"><button onclick='btnClick(this)'>emp33</button></td> -->
<!--             <td style="background-color: FC9;"><button onclick='btnClick(this)'>emp38</button></td> -->
<!--             <td style="background-color: FCC;"><button onclick='btnClick(this)'>emp43</button></td> -->
<!--             <td style="background-color: FCF;"><button onclick='btnClick(this)'>emp48</button></td> -->
<!--           </tr> -->
<!--           <tr> -->
<!--             <td>과장</td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp13</button></td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp24</button></td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp19</button></td> -->
<!--             <td style="background-color: FC6;"><button onclick='btnClick(this)'>emp29</button></td> -->
<!--             <td style="background-color: FC6;"><button onclick='btnClick(this)'>emp39</button></td> -->
<!--             <td style="background-color: FC9;"><button onclick='btnClick(this)'>emp34</button></td> -->
<!--             <td style="background-color: FCC;"><button onclick='btnClick(this)'>emp44</button></td> -->
<!--             <td style="background-color: FCF;"><button onclick='btnClick(this)'>emp49</button></td> -->
<!--           </tr> -->
<!--           <tr> -->
<!--             <td>차장</td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp14</button></td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp20</button></td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp25</button></td> -->
<!--             <td style="background-color: FC6;"><button onclick='btnClick(this)'>emp30</button></td> -->
<!--             <td style="background-color: FC6;"><button onclick='btnClick(this)'>emp35</button></td> -->
<!--             <td style="background-color: FC9;"><button onclick='btnClick(this)'>emp40</button></td> -->
<!--             <td style="background-color: FCC;"><button onclick='btnClick(this)'>emp45</button></td> -->
<!--             <td style="background-color: FCF;"><button onclick='btnClick(this)'>emp50</button></td> -->
<!--           </tr> -->
<!--           <tr> -->
<!--             <td>팀장</td> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp15</button> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp21</button> -->
<!--             <td style="background-color: FC0;"><button onclick='btnClick(this)'>emp26</button> -->
<!--             <td style="background-color: FC6;"><button onclick='btnClick(this)'>emp31</button> -->
<!--             <td style="background-color: FC6;"><button onclick='btnClick(this)'>emp36</button> -->
<!--             <td style="background-color: FC9;"><button onclick='btnClick(this)'>emp41</button> -->
<!--             <td style="background-color: FCC;"><button onclick='btnClick(this)'>emp46</button> -->
<!--             <td style="background-color: FCF;"><button onclick='btnClick(this)'>emp51</button> -->
<!--           </tr> -->
<!--           <tr> -->
<!--             <td>본부장</td> -->
<!--             <td colspan="2">경영지원본부<button onclick='btnClick(this)' style="background-color: FC0;">emp52</button></td> -->
<!--             <td colspan="2">사업기획본부<button onclick='btnClick(this)' style="background-color: FC6;">emp53</button></td> -->
<!--             <td colspan="2">공연사업본부<button onclick='btnClick(this)' style="background-color: FC9;">emp54</button></td> -->
<!--             <td colspan="2">콘텐츠본부<br><button onclick='btnClick(this)' style="background-color: FCC;">emp55</button></td> -->
<!--           </tr> -->
<!--           <tr> -->
<!--             <td>대표</td> -->
<!--             <td colspan="2">아티스트관리팀<button onclick='btnClick(this)' style="background-color: FCF;">emp56</button></td> -->
<!--             <td colspan="2">대표이사<br><button onclick='btnClick(this)'>emp16</button></td> -->
<!--           </tr> -->
<!--         </table> -->


<!--           </div> -->
    </div>
</section>
<script type="text/javascript">
// 작업용 자동 로그인(시연시 삭제) 시작
window.addEventListener('keydown', function(event) {
  if (event.key === 'Enter') {
    event.preventDefault(); // 기본 엔터키 동작 방지
    document.getElementById('loginButton').click(); // 로그인 버튼 클릭
  }
});
// 작업용 자동 로그인(시연시 삭제) 끝

$("#btnDefaultAuths").on("click",function(){
// 	$.ajax({
// 		url:"/createMembersAuths",
// 		type:"post",
// 		dataType:"text",
// 		success:function(result){
// 			console.log("result : ", result);

			alert("static폴더의 upload 폴더의 기본테이블SQL.txt를 참고하여 생성해주세요");
// 		}
// 	});
});


  function btnClick(buttonElement) {
    const myInput = document.getElementById('inputNanme4'); // 아이디 입력 필드
    myInput.value = buttonElement.innerText.trim(); // 버튼의 텍스트로 아이디 설정

    console.log("ID:", myInput.value);

    // 로그인 버튼 클릭
    document.getElementById('loginButton').click();
  }
  </script>

<!-- ///// content 끝 ///// -->

<%@ include file="../include/footer_user.jsp" %>
