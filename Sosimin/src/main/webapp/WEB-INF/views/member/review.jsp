<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="modal fade" id="reviewModal_${param.orderId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header" id="header_${param.orderId}">
			<h1 class="modal-title fs-5" id="staticBackdropLabel${param.orderId}">후기 등록</h1>
			<!-- 								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
			</div>
			<div class="modal-body" id="body_${param.orderId}">
				<div class="d-flex justify-content-center" id="categoryBtnArea_${param.orderId}">
					<input type="radio" class="btn-check" name="review_status" id="option1_${param.orderId}" value="bad" autocomplete="off" onchange="option1(${param.orderId})">
					<label class="btn btn-outline-primary mx-4" for="option1_${param.orderId}" style="opacity: 1;">별로예요</label>
					<input type="radio" class="btn-check" name="review_status" id="option2_${param.orderId}" value="good" autocomplete="off" onchange="option2(${param.orderId})">
					<label class="btn btn-outline-primary mx-4" for="option2_${param.orderId}" style="opacity: 1;">최고예요</label>
				</div>
				<div id="reviewCheck_${param.orderId}" class="mx-auto my-4 ps-3 w-75 text-start"></div>
			</div>
		<div class="modal-footer" id="footer_${param.orderId}"></div>
		</div>
	</div>
</div>