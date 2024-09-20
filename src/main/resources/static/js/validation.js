// 유효성 검사에 사용할 정규표현식
const reUid = /^[a-z]+[a-z0-9]{4,19}$/;
const rePass = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&()\-\_=+]).{5,16}$/;
const reName = /^[가-힣]{2,10}$/;
const reNick = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,4}$/i;
const reHp = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;

// 유효성 검사에 사용할 상태변수
let isUidOK = false;
let isPassOK = false;
let isNameOK = false;
let isNickOK = false;
let isEmailOK = false;
let isHpOK = false;

window.onload = function() {

	const btnCheckUid = document.getElementById('btnCheckUid');
	const btnCheckNick = document.getElementById('btnCheckNick');
	const btnSendEmail = document.getElementById('btnSendEmail');
	const btnAuthEmail = document.getElementById('btnAuthEmail');
	const registerForm = document.getElementsByTagName('form')[0];
	const uidResult = document.getElementsByClassName('uidResult')[0];
	const passResult = document.getElementsByClassName('passResult')[0];
	const nameResult = document.getElementsByClassName('nameResult')[0];
	const nickResult = document.getElementsByClassName('nickResult')[0];
	const emailResult = document.getElementsByClassName('emailResult')[0];
	const auth = document.getElementsByClassName('auth')[0];
	const hpResult = document.getElementsByClassName('hpResult')[0];

	// 1. 아이디 유효성 검사
	btnCheckUid.onclick = function() {

		const uid = registerForm.uid.value;
		// 1-1. 아이디 유효성 검사
		if (!uid.match(reUid)) {
			uidResult.innerText = '아이디가 유효하지 않습니다.';
			uidResult.style.color = 'red';
			isUidOK = false;
			return;
		}
		// 1-2. 아이디 중복 검사
		fetch('/sboard/user/checkUser?type=uid&value=' + uid)
			.then(resp => resp.json())
			.then(data => {
				console.log(data);
				if (data.result != 0) {
					uidResult.innerText = '이미 사용중인 아이디 입니다.';
					uidResult.style.color = 'red';
					isUidOK = false;
				} else {
					uidResult.innerText = '사용 가능한 아이디 입니다.';
					uidResult.style.color = 'green';
					isUidOK = true;
				}
			})
			.catch(err => {
				console.log(err)
			});
	}
	// 2. 비밀번호 유효성 검사

	registerForm.pass2.addEventListener('focusout', function() {
		const pass1 = registerForm.pass1.value;
		const pass2 = registerForm.pass2.value;

		if (!pass1.match(rePass)) {
			passResult.innerText = '유효하지 않은 비밀번호입니다.';
			passResult.style.color = 'red';
			isPassOK = false;
			return;
		}

		if (pass1 == pass2) {
			passResult.innerText = '사용 가능한 비밀번호입니다.';
			passResult.style.color = 'green';
			isPassOK = true;
		} else {
			passResult.innerText = '비밀번호가 일치하지 않습니다.';
			passResult.style.color = 'red';
			isPassOK = false;
		}
	});

	// 3. 이름 유효성 검사
	registerForm.name.addEventListener('focusout', function() {
		const name = registerForm.name.value;
		if (!name.match(reName)) {
			nameResult.innerText = '유효하지 않은 이름입니다.';
			nameResult.style.color = 'red';
			isNameOK = false;
		} else {
			nameResult.innerText = '';
			isNameOK = true;
		}
	});

	// 4. 별명 유효성 검사
	btnCheckNick.onclick = function() {
		const nick = registerForm.nick.value;

		// 4-1. 유효성 검사

		if (!nick.match(reNick)) {
			nickResult.innerText = '유효하지 않은 별명입니다.';
			nickResult.style.color = 'red';
			isNickOK = false;
			return;
		} else {
			nickResult.innerText = '';
			isNickOK = true;
		}

		// 4-2. 중복 검사
		fetch('/sboard/user/checkUser?type=nick&value=' + nick)
			.then(resp => resp.json())
			.then(data => {
				console.log(data);
				if (data.result != 0) {
					nickResult.innerText = '이미 사용중인 별명 입니다.';
					nickResult.style.color = 'red';
					isNickOK = false;
				} else {
					nickResult.innerText = '사용 가능한 별명 입니다.';
					nickResult.style.color = 'green';
					isNickOK = true;
				}
			})
			.catch(err => {
				console.log(err);
			})

	}

	// 5. 이메일 유효성 검사
	let preventDblClick = false;
	btnSendEmail.onclick = async function() {

		const email = registerForm.email.value;

		// 여러번 클릭 방지
		if (preventDblClick) {
			return;
		}

		// 이메일 유효성 검사
		if (!email.match(reEmail)) {
			emailResult.innerText = '형식이 올바르지 않습니다.';
			emailResult.style.color = 'red';
			isEmailOK = false;
			return;
		}

		try {
			preventDblClick = true;
			const response = await fetch('/sboard/user/checkUser?type=email&value=' + email);
			const data = await response.json();
			console.log(data);
			// 이메일 중복 확인
			if (data.result > 0) {
				emailResult.innerText = '이미 사용중인 이메일입니다.';
				emailResult.style.color = 'red';
				isEmailOK = false;
			} else {
				alert("이메일이 전송되었습니다.");
				emailResult.innerText = '이메일 인증코드를 확인하세요';
				emailResult.style.color = 'green';

				auth.style.display = 'block';
			}
		} catch (e) {
			console.log(e)
		}
	}// btnSendEmail.onclick END

	btnAuthEmail.onclick = async function() {
		const code = registerForm.auth.value;
		try {
			const resp = await fetch('/sboard/user/checkEmail', {
				method: 'POST',
				body: JSON.stringify({ "code": code })
			});
			const data = await resp.json();
			console.log(data);
			if (data.result > 0) {
				emailResult.innerText = '이메일이 인증되었습니다.';
				emailResult.style.color = 'green';
				isEmailOK = true;
			} else {
				emailResult.innerText = '유효한 코드가 아닙니다.';
				emailResult.style.color = 'red';
				isEmailOK = false;
			}
		} catch (e) {
			console.log(e)
		}

	}

	registerForm.email.addEventListener('focusout', function() {
		const email = registerForm.email.value;
		if (!email.match(reEmail)) {
			emailResult.innerText = '형식이 올바르지 않습니다.';
			emailResult.style.color = 'red';
		} else {
			emailResult.innerText = '';
		}
	});

	// 6. 핸드폰 유효성 검사
	registerForm.hp.addEventListener('focusout', async function() {
		const hp = registerForm.hp.value;

		if (!hp.match(reHp)) {
			hpResult.innerText = '형식이 올바르지 않습니다.';
			hpResult.style.color = 'red';
			isHpOK = false;
			return;
		}

		try {
			const resp = await fetch('/sboard/user/checkUser?type=hp&value=' + hp);
			const data = await resp.json();
			if (data.result > 0) {
				hpResult.innerText = '이미 등록된 번호 입니다.';
				hpResult.style.color = 'red';
				isHpOK = false;
			} else {
				hpResult.innerText = '';
				isHpOK = true;
			}
		} catch (e) {
			console.log(e)
		}

	});//hp.addEventListener END

	//최종 폼 전송 전 유효성 검사
	registerForm.onsubmit = function() {

		// 아이디 유효성 검사 완료 여부
		if (!isUidOK) {
			alert('아이디 중복 검사를 진행해주세요.');
			return false; // 폼 전송 취소
		}
		// 비밀번호 유효성 검사 완료 여부
		if (!isPassOK) {
			alert('유효하지 않은 비밀번호입니다.');
			return false; // 폼 전송 취소
		}
		// 이름 유효성 검사 완료 여부
		if (!isNameOK) {
			alert('유효하지 않은 이름입니다.');
			return false; // 폼 전송 취소
		}
		// 별명 유효성 검사 완료 여부
		if (!isNickOK) {
			alert('유효하지 않은 별명입니다.');
			return false; // 폼 전송 취소
		}
		// 이메일 유효성 검사 완료 여부
		if (!isEmailOK) {
			alert('이메일 인증을 진행해주세요.');
			return false; // 폼 전송 취소
		}
		// 휴대폰 유효성 검사 완료 여부
		if (!isHpOK) {
			alert('유효하지 않은 휴대폰번호입니다.');
			return false; // 폼 전송 취소
		}

		alert('정상적으로 가입되었습니다');
		return true;
	}




} // onload END


