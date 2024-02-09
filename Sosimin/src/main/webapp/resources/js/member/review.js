// ======================== 후기 작성 ========================

	// --------- 카테고리 선택 ------------
	function option1(opt) {
		$(".modal-body input[type='checkbox']").prop('checked', false);
		$("#hugiLabel1").text("약속 장소에 나타나지 않아요");
		$("#hugiLabel2").text("상품 상태가 설명과 달라요");
		$("#hugiLabel3").text("시간 약속을 못 지켜요");
		$("#hugiLabel4").text("응답이 없어요");
	}
	function option2(opt) {
		$(".modal-body input[type='checkbox']").prop('checked', false);
		$("#hugiLabel1").text("제가 있는곳까지 와서 거래했어요");
		$("#hugiLabel2").text("친절하고 매너가 좋아요");
		$("#hugiLabel3").text("시간 약속을 잘 지켜요");
		$("#hugiLabel4").text("응답이 빨라요");
	}
	// ------------------------------------
	
	// --------- 후기 작성 ------------
	// 후기작성하기 버튼 클릭 시 호출되는 함수 정의
	function writeReview(btn) {
		let order_id = $(btn).data("id");
		let modal = $("#reviewModal_"+ order_id);
		// 모달 제목 변경
		modal.find(".modal-title").text("거래 후기 작성");
		
		// 최고예요가 기본적으로 체크된다.
		$("#categoryBtnArea_" + order_id).find("#option2_" + order_id).attr("checked", true);
		// 카테고리 disabled 해제
		$("#categoryBtnArea_" + order_id).find("input[type='radio']").attr("disabled", false);
		// 체크 항목 작성
		$("#reviewCheck_" + order_id).html(
				'<ul class="list-group list-group-flush reviewList' + order_id + '">'
					+ '<li class="list-group-item">'
						+ '<input class="form-check-input me-1" type="checkbox" name="review_check1" id="review_check1">'
						+ '<label class="form-check-label fs-6 fw-bold" for="review_check1" id="hugiLabel1">'
							+ '제가 있는곳까지 와서 거래했어요'
						+ '</label>'
					+ '</li>'
					+ '<li class="list-group-item">'
						+ '<input class="form-check-input me-1" type="checkbox" name="review_check2" id="review_check2">'
						+ '<label class="form-check-label fs-6 fw-bold" for="review_check2" id="hugiLabel2">'
							+ '친절하고 매너가 좋아요'
						+ '</label>'
					+ '</li>'
					+ '<li class="list-group-item">'
						+ '<input class="form-check-input me-1" type="checkbox" name="review_check3" id="review_check3">'
						+ '<label class="form-check-label fs-6 fw-bold" for="review_check3" id="hugiLabel3">'
							+ '시간 약속을 잘 지켜요'
						+ '</label>'
					+ '</li>'
					+ '<li class="list-group-item">'
						+ '<input class="form-check-input me-1" type="checkbox" name="review_check4" id="review_check4">'
						+ '<label class="form-check-label fs-6 fw-bold" for="review_check4" id="hugiLabel4">'
							+ '응답이 빨라요'
						+ '</label>'
					+ '</li>'
				+ '</ul>'
		);
		
		// 하단 버튼 생성
		$("#footer_" + order_id).html(
				'<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose_' + order_id + '">창닫기</button>'
				+ '<button type="submit" class="btn btn-primary" id="reviewBtn" onclick="reviewRegist(' + order_id + ')">'
				+'후기 등록</button>'	
		);
	}
	
	// 후기 작성하기 버튼을 눌러 후기 작성하기
	function reviewRegist(order_id) {
		let modal_body = $("#body_"+ order_id);
		let btnParent = $(".reviewBtn_" + order_id).parent();
		if(modal_body.find("input[type='checkbox']:checked").length == 0) { // 항목 체크를 안한 경우
			Swal.fire({
				position: 'center',
				icon: 'warning',
				title: '후기를 선택해주세요.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			});
		} else {
			Swal.fire({
		        title: '후기를 등록하시겠습니까?',
		        icon: 'question',
		        showCancelButton: true,
		        confirmButtonColor: '#39d274',
		        cancelButtonColor: '#d33',
		        confirmButtonText: '등록',
		        cancelButtonText: '취소',
		        reverseButtons: true,
		    }).then((result) => {
		    	if (result.isConfirmed) {
					let data = new FormData();
					// 리뷰 항목 이름으로 폼객체에 저장
					$("#reviewModal_" + order_id + " input:checked").each(function() {
						data.append($(this).attr('name'), $(this).val());
					});
					data.append("order_id", order_id);
					
					$.ajax({
						type: "POST",
						url: "ReviewRegist",
						data: data,
					    processData: false,
					    contentType: false,
						success: function(result) {
							if(result == 'true') {
								Swal.fire({
									position: 'center',
									icon: 'success',
									title: '거래 후기를 등록했습니다.',
									showConfirmButton: false,
									timer: 2000,
									toast: true
								});
								// 후기 작성 시 후기보기 버튼으로 변경
								$(".reviewBtn_" + order_id).remove();
								$(btnParent).append('<input type="button" class="reviewBtn_' + order_id + '" data-id="' + order_id + '" value="보낸 후기 보기" data-bs-toggle="modal" data-bs-target="#reviewModal_' + order_id + '" onclick="reviewView(this)">');
								$("#reviewClose_" + order_id).click();
							} else if(result == 'false') {
								Swal.fire({
									position: 'center',
									icon: 'error',
									title: '후기 등록을 실패했습니다.',
									showConfirmButton: false,
									timer: 2000,
									toast: true
								});
							}
						}
					}); // ajax 끝
		    	}
		    }); // confirm 끝
		}
	}
	// ----------------------------------------
	
	// --------- 후기 보기 ------------
	// 후기보기 버튼 클릭 시 호출되는 함수 정의
	function reviewView(btn) {
		let order_id = $(btn).data("id");
		let modal = $("#reviewModal_"+ order_id);
		// 모달 제목 변경
		modal.find(".modal-title").text("보낸 후기 보기");
		// 카테고리 disabled
		$("#categoryBtnArea_" + order_id).find("input[type='radio']").attr("disabled", true);
		$("#reviewCheck").empty();
		
		$.ajax({
			type: "POST",
			url: "ReviewView",
			data: {
				order_id: order_id
			},
			dataType: "json",
			success: function(result) {
				console.log(result);
				$("#reviewCheck_" + order_id).html('<ul class="list-group list-group-flush ps-4 reviewList' + order_id + '"></ul>');
				let list = $(".reviewList" + order_id);
				if(result.review_status == "good") {
					$("#option1_" + order_id).prop("checked", false);
					$("#option2_" + order_id).prop("checked", true);
					
					if(result.review_check1 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">제가 있는곳까지 와서 거래했어요</li>');
					}
					if(result.review_check2 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">친절하고 매너가 좋아요</li>');
					}
					if(result.review_check3 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">시간 약속을 잘 지켜요</li>');
					}
					if(result.review_check4 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">응답이 빨라요</li>');
					}
					
				} else {
					$("#option1_" + order_id).prop("checked", true);
					$("#option2_" + order_id).prop("checked", false);
					
					if(result.review_check1 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">약속 장소에 나타나지 않아요</li>');
					}
					if(result.review_check2 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">친절하고 매너가 좋아요</li>');
					}
					if(result.review_check3 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">시간 약속을 못 지켜요</li>');
					}
					if(result.review_check4 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">응답이 없어요</li>');
					}
				}
				
				$(".modal-footer").html(
						'<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose_' + order_id + '">창닫기</button>'
						+ '<button type="button" class="btn btn-primary" id="reviewBtn" onclick="reviewDelete(' + order_id + ')">'
						+'후기 삭제</button>'	
				);
			},
			error: function(xhr, textStatus, errorThrown) {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '비정상적인 접근입니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
			}
		});
	}
	
	// 보낸 후기 버튼을 눌러 후기 삭제하기
	function reviewDelete(order_id) {
		let btnParent = $(".reviewBtn_" + order_id).parent();
		Swal.fire({
	        title: '후기를 삭제하시겠습니까?',
	        text: '삭제 시 회원님의 경험치가 차감됩니다.',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#d33',
	        cancelButtonColor: '#888',
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	    }).then((result) => {
	    	if (result.isConfirmed) {
				$.ajax({
					type: "POST",
					url: "ReviewDelete",
					data:{
						order_id: order_id						
					},
					success: function(result) {
						if(result == 'true') {
							Swal.fire({
								position: 'center',
								icon: 'success',
								title: '보낸 후기를 삭제했습니다.',
								showConfirmButton: false,
								timer: 2000,
								toast: true
							});
							
							// 후기 삭제 시 후기작성 버튼으로 변경
							$(".reviewBtn_" + order_id).remove();
							$(btnParent).append('<input type="button" class="reviewBtn_' + order_id + '" data-id="' + order_id + '" value="거래 후기 작성" data-bs-toggle="modal" data-bs-target="#reviewModal_' + order_id + '" style="background-color: #fff; border: 1px solid; color: #39D274;" onclick="writeReview(this)">');
							$("#reviewModal_" + order_id).modal("hide");
							$('.modal-backdrop').remove();
						} else if(result == 'false') {
							Swal.fire({
								position: 'center',
								icon: 'error',
								title: '후기 등록을 실패했습니다.',
								showConfirmButton: false,
								timer: 2000,
								toast: true
							});
						}
					}
				}); // ajax 끝
	    	}
	    }); // confirm 끝
	}
	// ----------------------------------------