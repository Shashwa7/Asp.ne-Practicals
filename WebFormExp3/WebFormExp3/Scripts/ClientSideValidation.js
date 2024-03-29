﻿//email validation---------------------------------------------------
document.getElementById("u_email").addEventListener('keyup', () => {

    const input = document.getElementById("u_email");

    if (checkEmail(input.value)) {
        input.classList.add('is-valid');
        input.classList.remove('is-invalid');
    }
    else {
        input.classList.add('is-invalid');
        input.classList.remove('is-valid');
    }

    if (input.value.length === 0) {
        console.log('empty');
        input.classList.remove('is-invalid');
    }

});

const checkEmail = input => {
    const regex = /^([\w.%])+@([\w])+\.([a-z]){2,3}$/;

    if (regex.test(input))
        return true;
    else
        return false;
};



//user age validation---------------------------------------------

document.getElementById("u_age").addEventListener('keyup', () => {
    const input = document.getElementById("u_age");

    if (checkUserage(input.value)) {
        input.classList.add('is-valid');
        input.classList.remove('is-invalid');
    }
    else {
        input.classList.add('is-invalid');
        input.classList.remove('is-valid');
    }

    if (input.value.length === 0) {
        console.log('empty');
        input.classList.remove('is-invalid');
    }

})

const checkUserage = input => {
    const regex = /^([7-9]|1[0-9]|2[01])$/; //only nums [7,21] allowed

    if (regex.test(input))
        return true;
    else
        return false;

}


//username validation---------------------------------------------

document.getElementById("u_name").addEventListener('keyup', () => {
    const input = document.getElementById("u_name");

    if (checkUsername(input.value)) {
        input.classList.add('is-valid');
        input.classList.remove('is-invalid');
    }
    else {
        input.classList.add('is-invalid');
        input.classList.remove('is-valid');
    }

    if (input.value.length === 0) {
        console.log('empty');
        input.classList.remove('is-invalid');
    }

})

const checkUsername = input => {
    const regex = /^\w+$/; //only ltrs, nums, _ allowed

    if (regex.test(input))
        return true;
    else
        return false;

}


//userID validation---------------------------------------------

document.getElementById("u_ID").addEventListener('keyup', () => {
    const input = document.getElementById("u_ID");

    if (checkUserID(input.value)) {
        input.classList.add('is-valid');
        input.classList.remove('is-invalid');
    }
    else {
        input.classList.add('is-invalid');
        input.classList.remove('is-valid');
    }

    if (input.value.length === 0) {
        console.log('empty');
        input.classList.remove('is-invalid');
    }

})

const checkUserID = input => {
    const regex = /^(?=.*\d)(?=.*[A-Z]).{7,20}$/; //only ltrs, nums, _ allowed

    if (regex.test(input))
        return true;
    else
        return false;
}

//pwd re enter validation
document.getElementById("u_pwdCopy").addEventListener('keyup', () => {
    const input = document.getElementById("u_pwdCopy");
    const og_pwd = document.getElementById("u_pwd");
    if (input.value === og_pwd.value) {
        input.classList.add('is-valid');
        input.classList.remove('is-invalid');
    }
    else {
        input.classList.add('is-invalid');
        input.classList.remove('is-valid');
    }

    if (input.value.length === 0) {
        console.log('empty');
        input.classList.remove('is-invalid');
    }

})

//pwd validation------------------------------------
let pwdStack = [];

//Badeges
const upperBadge = document.querySelector('.uRq');
const lowerBadge = document.querySelector('.lRq');
const specialBadge = document.querySelector('.sRq');
const digitBadge = document.querySelector('.dRq');
const minCharBadge = document.querySelector('.minRq');

//to check if the latest pwd has atleast requiments
function atleastOne(num, badge) {
    if (num < 1)
        badge.classList.remove('badge-success');
}

document.getElementById("u_pwd").addEventListener('keyup', () => {
    const input = document.getElementById("u_pwd");
    checkPwdStatus(input.value); //cheking for realtime pwd status for badges

    if (checkPwd(input.value)) {
        input.classList.add('is-valid');
        input.classList.remove('is-invalid');

    }
    else {
        input.classList.add('is-invalid');
        input.classList.remove('is-valid');
    }

    if (input.value.length === 0) {
        console.log('empty');
        input.classList.remove('is-invalid');
    }

});

//password validation
const checkPwd = input => {

    const regex = /^(?=.*\W)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;

    if (regex.test(input))
        return true;
    else
        return false;
}

const checkPwdStatus = input => {

    pwdStack.push(input); //pushing user input into the array

    const latestPwd = pwdStack[pwdStack.length - 1];
    const latestPassInArray = pwdStack[pwdStack.length - 1].split(''); //fetching only last word from the array and futher splitting it into array

    const checkSpecial = /\W/;
    const checkLower = /[a-z]/;
    const checkUpper = /[A-Z]/;
    const checkDigit = /\d/;

    let spcCount = 0;
    let uprCount = 0;
    let lwrCount = 0;
    let digiCount = 0;

    latestPassInArray.forEach(ltr => {

        if (checkUpper.test(ltr)) {
            upperBadge.classList.add('badge-success');
            uprCount++;
        }
        if (checkLower.test(ltr)) {
            lowerBadge.classList.add('badge-success');
            lwrCount++;
        }
        if (checkDigit.test(ltr)) {
            digitBadge.classList.add('badge-success');
            digiCount++;
        }
        if (checkSpecial.test(ltr)) {
            specialBadge.classList.add('badge-success');
            spcCount++;
        }
    });

    atleastOne(uprCount, upperBadge);
    atleastOne(lwrCount, lowerBadge);
    atleastOne(spcCount, specialBadge);
    atleastOne(digiCount, digitBadge);

    //check pwd string length : min-length = 8;
    if (latestPwd.length > 7)
        minCharBadge.classList.add('badge-success');
    else
        minCharBadge.classList.remove('badge-success');

}