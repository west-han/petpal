<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petpal FAQ</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<div class="w-50 p-3 mx-auto m-5">
	<h1 class="text-center">FAQ</h1>
	<div class="accordion" id="accordionExample">
	  <div class="accordion-item">
	    <h2 class="accordion-header">
	      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	        주문 시 본인인증은 왜 하는건가요?
	      </button>
	    </h2>
	    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
	    	<div class="accordion-body">
			  petpal은 부정한 방법으로 신규회원 혜택 및 이벤트 참여를 제한하여 더 많은 고객들에게 큰 혜택을 제공하기 위해 주문 시 최초 1회 본인인증을 진행합니다.
			  <br><br>
			  ※ 본인인증은 명의 기준 1개의 휴대폰번호에 1개의 ID에 인증 가능합니다.
			  <br>
			  ※ 여러 아이디를 보유하고 있으신 경우 최초 본인인증을 진행한 ID만 사용 가능합니다.
			  <br>
			  ※ 본인인증 후 탈퇴 시 동일한 휴대폰번호는 30일간 재가입이 불가능합니다.
			</div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	        작성한 후기가 보이지 않아요
	      </button>
	    </h2>
	    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
		  <p>작성한 후기가 고양이대통령 후기 노출 기준에 맞지 않을 경우 삭제 또는 열람이 제한될 수 있습니다.</p>
		  <p>① 상품과 무관한 내용</p>
		  <p>② 성의없는 내용 작성 (동일한 내용 반복, 자음/모음 나열 등)</p>
		  <p>③ 허위 또는 과장, 광고 내용을 포함한 경우</p>
		  <p>④ 불법물, 음란물 또는 청소년유해매체물의 게시</p>
		  <p>⑤ 직접 촬영하지 않은 이미지 (상품페이지 등의 화면 캡처)</p>
		  <p>⑥ 구매 상품과 무관한 이미지  (바닥, 풍경, 연예인, 강아지, 고양이 등 구매한 상품이 보이지 않는 포토후기)</p>
		  <p>⑦ 그 외 서비스의 원활한 진행을 방해하는 것으로 판단되는 경우</p>
		  <p>⑧ 반품 등으로 구매가 취소된 경우</p>
		</div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
	        보유캐시는 어떻게 사용하나요?
	      </button>
	    </h2>
	    <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	      	상품을 구매할 경우 일반 현금과 동일하게 사용할 수 있으며, 구매하는 장바구니 상품 금액의 최대 10%까지 사용 가능합니다.
	      	<br>
			상품 구매 시 주문결제 페이지의 보유캐시 항목에서 최대 사용할 수 있는 금액 확인이 가능합니다.
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
	        보유캐시란 무엇인가요?
	      </button>
	    </h2>
	    <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
			<div class="accordion-body">
			  상품 구매 시 현금처럼 사용할 수 있는 고양이대통령의 적립금 제도입니다.
			  <br><br>
			  상품 구매, 구매 후기 작성, 이벤트로 지급되는 무상 보유캐시와<br>
			  반품 시 발생되는 환불 금액을 지급받는 유상 보유캐시로 구분됩니다.
			  <br><br>
			  [무상 보유캐시]<br>
			  상품 구매 시 - 등급별 차등 지급<br>
			  구매후기 작성 시 - 일반 후기 300원 / 포토 후기 500원 (단, 상품의 첫 후기인 경우 두 배 지급)<br>
			  > 상품 구매 후 6개월 이내에 작성 가능합니다.
			  <br><br>
			  [유상 보유캐시]<br>
			  구매한 상품 중 일부 상품을 반품 시 환불 수단을 보유캐시로 선택하는 경우 지급
			  <br><br>
			  보유캐시는 상품 구매 시 간편하게 결제할 수 있으므로 상품을 빠른 시일 내에 재구매하거나 자주 구매하는 경우 편리하게 이용할 수 있습니다.<br>
			  다만, 결제금액의 최대 10%까지만 사용 가능합니다.
			</div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
	        반품/환불 정책은 어떻게 되나요?
	      </button>
	    </h2>
	    <div id="collapseFive" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	      	반품/환불 정책은 상품 수령 후 7일 이내에 가능합니다. 단, 상품이 훼손되었거나 사용된 경우는 제외됩니다.
	      	<br>
			환불은 결제 수단에 따라 처리되며, 보유캐시로 환불을 선택할 경우 유상 보유캐시로 지급됩니다.
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
	        회원 등급은 어떻게 결정되나요?
	      </button>
	    </h2>
	    <div id="collapseSix" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	      	회원 등급은 구매 금액에 따라 결정됩니다. 총 구매 금액이 일정 기준을 초과하면 자동으로 등급이 상승합니다.
	      	<br>
			등급별 혜택은 홈페이지에서 확인할 수 있습니다.
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
	        적립금 유효기간은 어떻게 되나요?
	      </button>
	    </h2>
	    <div id="collapseSeven" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	      	적립금의 유효기간은 적립일로부터 1년입니다. 유효기간 내에 사용하지 않은 적립금은 소멸됩니다.
	      	<br>
			소멸 예정인 적립금은 마이페이지에서 확인할 수 있습니다.
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
	        이벤트 참여 방법은 무엇인가요?
	      </button>
	    </h2>
	    <div id="collapseEight" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	      	이벤트 참여는 홈페이지 또는 앱을 통해 가능합니다. 이벤트 페이지에서 참여 버튼을 클릭하고 안내에 따라 진행하시면 됩니다.
	      	<br>
			이벤트 당첨자는 개별 통보되며, 홈페이지 공지사항에서도 확인할 수 있습니다.
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
	        포인트 적립 방법은 어떻게 되나요?
	      </button>
	    </h2>
	    <div id="collapseNine" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	      	포인트는 상품 구매 시 자동으로 적립됩니다. 또한, 다양한 프로모션 및 이벤트에 참여하여 추가 포인트를 적립할 수 있습니다.
	      	<br>
			적립된 포인트는 마이페이지에서 확인할 수 있습니다.
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
	        고객센터 운영 시간은 어떻게 되나요?
	      </button>
	    </h2>
	    <div id="collapseTen" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	      	고객센터는 평일 오전 9시부터 오후 6시까지 운영됩니다. 주말 및 공휴일은 운영되지 않습니다.
	      	<br>
			문의는 고객센터 전화 또는 이메일을 통해 가능합니다.
	      </div>
	    </div>
	  </div>
	</div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
