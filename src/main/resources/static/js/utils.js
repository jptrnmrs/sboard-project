// fetch GET용
async function fetchGet(url){

    console.log("fetchData1...1");

    try{
        console.log("fetchData1...2");
        const response = await fetch(url);
        console.log("here1");

        if(!response.ok){
            console.log("here2");
            throw new Error('response not ok');
        }

        const data = await response.json();
        console.log("data1 : " + data);

        return data;

    }catch (err) {
        console.log(err)
    }
}

// fetch POST용
async function fetchPost(url, jsonData){

    console.log("fetchData2...1");

    try{
        console.log("fetchData2...2");
        const response = await fetch(url, {
            method: 'POST',
            headers: {"Content-type":"application/json"},
            body: JSON.stringify(jsonData)
        });
        console.log("fetchData2...3");

        if(!response.ok){
            console.log("fetchData2...4");
            throw new Error('response not ok');
        }

        const data = await response.json();
        console.log("fetchData2...5 : " + data);

        return data;

    }catch (err) {
        console.log(err)
        return null;
    }
}

// fetch DELETE용
async function fetchDelete(url){

    try{
        const response = await fetch(url, {
            method: 'DELETE'
        });

        if(!response.ok){
            throw new Error('response not ok');
        }

        const data = await response.json();
        console.log("data1 : " + data);

        return data;

    }catch (err) {
        console.log(err)
    }
}


// fetch PUT용
async function fetchPut(url, jsonData){

    try{
        const response = await fetch(url, {
            method: 'PUT',
            headers: {"Content-type":"application/json"},
            body: JSON.stringify(jsonData)
        });

        if(!response.ok){
            throw new Error('response not ok');
        }

        const data = await response.json();
        console.log("data1 : " + data);

        return data;

    }catch (err) {
        console.log(err)
    }
}


function alertModal(message){
    const modal = document.getElementById('alertModal');
    modal.getElementsByClassName('modal-body')[0].innerText = message;
    const resultModal = new bootstrap.Modal(modal);
    resultModal.show();
}

function confirmModal(message){
    return new Promise(function (resolve, reject){
        const confirmModal = document.getElementById('confirmModal');
        const btnOk = document.getElementById('btnOk');
        const btnCancel = document.getElementById('btnCancel');
        confirmModal.getElementsByClassName('modal-body')[0].innerText = message;

        const modal = new bootstrap.Modal(confirmModal);
        modal.show(); // 모달 열기

        // 확인 버튼 클릭 시
        btnOk.addEventListener('click', function (){
            resolve(true);
        });

        // 취소 버튼 클릭 시
        btnCancel.addEventListener('click', function (){
            resolve(false);
        });
    });

}

function showResultValid(result, message){
    result.style.color = 'green';
    result.innerText = message;
}

function showResultInvalid(result, message){
    result.style.color = 'red';
    result.innerText = message;
}
function postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업을 통한 검색 결과 항목 클릭 시 실행
            var addr = ''; // 주소_결과값이 없을 경우 공백
            var extraAddr = ''; // 참고항목

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 도로명 주소를 선택
                addr = data.roadAddress;
            } else { // 지번 주소를 선택
                addr = data.jibunAddress;
            }

            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraAddr !== '') {
                    extraAddr = '(' + extraAddr + ')';
                }
            } else {
                registerForm.addr1.value = '';
            }

            // 선택된 우편번호와 주소 정보를 input 박스에 넣는다.
            document.getElementById('zip').value = data.zonecode;
            document.getElementById('addr1').value = addr;
            document.getElementById('addr2').value += extraAddr;
            document.getElementById('addr2').focus(); // 우편번호 + 주소 입력이 완료되었음으로 상세주소로 포커스 이동
        }
    }).open();
}