<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
      
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="colorlib.com">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Thuê xe</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">
        
        <!-- Premium Google Fonts, FontAwesome 6 and Bootstrap Icons for stunning typography and elements -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<!--        
        <link href="assets/bootstrap.min.css" rel="stylesheet"/>
         Custom styles for this template 
        <link href="assets/jumbotron-narrow.css" rel="stylesheet">      -->
        <script src="assets/jquery-1.11.3.min.js"></script>
        
        <!-- Main css -->
        <style>
            /* @extend display-flex; */
            display-flex,
            .form-flex,
            .form-date-group,
            .form-radio-group,
            .steps ul,
            .title,
            .title .step-number,
            .actions ul li a,
            .form-radio-flex,
            .form-find {
                display: flex;
                display: -webkit-flex;
            }

            /* @extend list-type-ulli; */
            list-type-ulli,
            .steps ul,
            .actions ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }

            /* roboto-slab-300 - latin */
            @font-face {
                font-family: 'Roboto Slab';
                font-style: normal;
                font-weight: 300;
                src: url("../fonts/roboto-slab/roboto-slab-v7-latin-300.eot");
                /* IE9 Compat Modes */
                src: local("Roboto Slab Light"), local("RobotoSlab-Light"), url("../fonts/roboto-slab/roboto-slab-v7-latin-300.eot?#iefix") format("embedded-opentype"), url("../fonts/roboto-slab/roboto-slab-v7-latin-300.woff2") format("woff2"), url("../fonts/roboto-slab/roboto-slab-v7-latin-300.woff") format("woff"), url("../fonts/roboto-slab/roboto-slab-v7-latin-300.ttf") format("truetype"), url("../fonts/roboto-slab/roboto-slab-v7-latin-300.svg#RobotoSlab") format("svg");
                /* Legacy iOS */
            }

            /* roboto-slab-regular - latin */
            @font-face {
                font-family: 'Roboto Slab';
                font-style: normal;
                font-weight: 400;
                src: url("../fonts/roboto-slab/roboto-slab-v7-latin-regular.eot");
                /* IE9 Compat Modes */
                src: local("Roboto Slab Regular"), local("RobotoSlab-Regular"), url("../fonts/roboto-slab/roboto-slab-v7-latin-regular.eot?#iefix") format("embedded-opentype"), url("../fonts/roboto-slab/roboto-slab-v7-latin-regular.woff2") format("woff2"), url("../fonts/roboto-slab/roboto-slab-v7-latin-regular.woff") format("woff"), url("../fonts/roboto-slab/roboto-slab-v7-latin-regular.ttf") format("truetype"), url("../fonts/roboto-slab/roboto-slab-v7-latin-regular.svg#RobotoSlab") format("svg");
                /* Legacy iOS */
            }

            /* roboto-slab-700 - latin */
            @font-face {
                font-family: 'Roboto Slab';
                font-style: normal;
                font-weight: 700;
                src: url("../fonts/roboto-slab/roboto-slab-v7-latin-700.eot");
                /* IE9 Compat Modes */
                src: local("Roboto Slab Bold"), local("RobotoSlab-Bold"), url("../fonts/roboto-slab/roboto-slab-v7-latin-700.eot?#iefix") format("embedded-opentype"), url("../fonts/roboto-slab/roboto-slab-v7-latin-700.woff2") format("woff2"), url("../fonts/roboto-slab/roboto-slab-v7-latin-700.woff") format("woff"), url("../fonts/roboto-slab/roboto-slab-v7-latin-700.ttf") format("truetype"), url("../fonts/roboto-slab/roboto-slab-v7-latin-700.svg#RobotoSlab") format("svg");
                /* Legacy iOS */
            }

            a:focus,
            a:active {
                text-decoration: none;
                outline: none;
                transition: all 300ms ease 0s;
                -moz-transition: all 300ms ease 0s;
                -webkit-transition: all 300ms ease 0s;
                -o-transition: all 300ms ease 0s;
                -ms-transition: all 300ms ease 0s;
            }

            input,
            select,
            textarea {
                outline: none;
                appearance: unset !important;
                -moz-appearance: unset !important;
                -webkit-appearance: unset !important;
                -o-appearance: unset !important;
                -ms-appearance: unset !important;
            }

            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                appearance: none !important;
                -moz-appearance: none !important;
                -webkit-appearance: none !important;
                -o-appearance: none !important;
                -ms-appearance: none !important;
                margin: 0;
            }

            input:focus,
            select:focus,
            textarea:focus {
                outline: none;
                box-shadow: none !important;
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                -o-box-shadow: none !important;
                -ms-box-shadow: none !important;
            }

            input[type=checkbox] {
                appearance: checkbox !important;
                -moz-appearance: checkbox !important;
                -webkit-appearance: checkbox !important;
                -o-appearance: checkbox !important;
                -ms-appearance: checkbox !important;
            }

            input[type=radio] {
                appearance: radio !important;
                -moz-appearance: radio !important;
                -webkit-appearance: radio !important;
                -o-appearance: radio !important;
                -ms-appearance: radio !important;
            }

            .clear {
                clear: both;
            }

            .upload-card-wrapper {
                flex: 1;
                min-width: 0;
                position: relative;
            }
            .upload-card {
                padding: 20px 10px;
                border: 2px dashed #d1d5db;
                border-radius: 12px;
                text-align: center;
                background: #f9fafb;
                cursor: pointer;
                transition: all 0.3s ease;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 140px;
                position: relative;
                overflow: hidden;
                width: 100%;
                box-sizing: border-box;
            }
            .upload-card:hover {
                border-color: #046fd4;
                background: #f0f7ff;
            }
            .upload-card.uploaded {
                border-color: #16a34a;
                background: #f0fdf4;
            }
            .upload-card.uploaded i {
                color: #16a34a !important;
            }
            .upload-card.uploaded .upload-title {
                color: #15803d;
            }
            .upload-card.uploaded .upload-subtitle {
                color: #16a34a;
            }
            .upload-card i {
                font-size: 36px;
                color: #9ca3af;
                margin-bottom: 8px;
                transition: color 0.3s ease;
            }
            .upload-card:hover i {
                color: #046fd4;
            }
            .upload-card .upload-title {
                font-weight: 600;
                color: #374151;
                font-size: 14px;
            }
            .upload-card .upload-subtitle {
                font-size: 12px;
                color: #6b7280;
                margin-top: 4px;
            }
            .image-preview-container {
                width: 100%;
                margin-top: 15px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .img-preview {
                max-width: 100%;
                max-height: 200px;
                object-fit: contain;
                border-radius: 8px;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                border: 1px solid #e5e7eb;
            }
            .existing-image-label {
                font-size: 0.85rem;
                color: #6b7280;
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
            }

            h2 {
                font-size: 30px;
                margin: 0px;
            }

            body {
                font-size: 14px;
                line-height: 1.6;
                color: #001973;
                font-weight: 400;
                font-family: 'Roboto Slab';
                margin: 0px;
                background: #222;
                position: relative;
                padding: 0px;
            }

            .main {
                padding: 50px 0;
                position: relative;
                z-index: 99;
            }

            .container-booking {
                width: 1400px;
                margin: 0 auto;
                background: #fff;
            }

            fieldset {
                padding: 0px;
                margin: 0px;
                border: none;
                padding-left: 45px;
                padding-right: 55px;
                padding-top: 45px;
            }

            p.desc {
                margin: 0px;
                margin-bottom: 40px;
                color: #555;
            }

            .form-label {
                display: block;
                width: 100%;
                font-size: 16px;
                margin: 5px 0;
            }

            .text-input {
                font-size: 12px;
                color: #999;
                display: block;
                margin-top: 5px;
            }

            .text-input span {
                color: #222;
                font-weight: bold;
            }

            input,
            select {
                width: 100%;
                display: block;
                border: 1px solid #ebebeb;
                height: 37px;
                box-sizing: border-box;
                padding: 0 20px;
                color: #222;
                font-weight: bold;
                font-size: 14px;
                font-family: 'Roboto Slab';
            }

            #steps-uid-0-p-0 .form-row,
            #steps-uid-0-p-0 .form-group,
            #steps-uid-0-p-0 .form-date {
                width: 1000px;
            }

            .form-flex {
                margin: 0 -10px;
            }

            .form-flex .form-group {
                width: 50%;
                padding: 0 10px;
            }

            .form-group,
            .form-date {
                margin-bottom: 2px;
                position: relative;
            }

            .form-date-group {
                border: 1px solid transparent;
                border-radius: 5px;
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
                -o-border-radius: 5px;
                -ms-border-radius: 5px;
            }

            .form-date-group select {
                border: 1px solid #ebebeb;
                width: 100%;
                box-sizing: border-box;
                appearance: none !important;
                -moz-appearance: none !important;
                -webkit-appearance: none !important;
                -o-appearance: none !important;
                -ms-appearance: none !important;
                position: relative;
                background: 0 0;
                z-index: 10;
                cursor: pointer;
                padding: 0 20px;
                height: 37px;
                font-size: 14px;
                font-family: 'Roboto Slab';
                color: #999;
                box-sizing: border-box;
                background-color: #fff;
                color: #222;
                font-weight: bold;
            }

            .form-date-item {
                position: relative;
                overflow: hidden;
                width: 100px;
                margin-right: 10px;
            }

            .vertical {
                display: block;
                width: 100%;
                overflow: hidden;
                background-color: #effaf4;
            }

            .vertical .steps {
                float: left;
                width: 310px;
            }

            .vertical .content,
            .vertical .actions {
                float: right;
                width: 1090px;
            }

            .content {
                height: 800px;
                background-color: white;
            }

            .steps ul {
                flex-direction: column;
                -moz-flex-direction: column;
                -webkit-flex-direction: column;
                -o-flex-direction: column;
                -ms-flex-direction: column;
                position: relative;
                padding-left: 40px;
                padding-top: 60px;
            }

            .steps ul li {
                padding-bottom: 30px;
                position: relative;
                z-index: 99;
            }

            .steps ul li a {
                text-decoration: none;
                color: #222;
            }

            .steps ul:after {
                position: absolute;
                content: '';
                width: 2px;
                height: 400px;
                background: #ebebeb;
                left: 64px;
                top: 50%;
                transform: translateY(-50%);
                -moz-transform: translateY(-50%);
                -webkit-transform: translateY(-50%);
                -o-transform: translateY(-50%);
                -ms-transform: translateY(-50%);
                z-index: 9;
            }

            .title {
                align-items: center;
                -moz-align-items: center;
                -webkit-align-items: center;
                -o-align-items: center;
                -ms-align-items: center;
            }

            .title .step-number {
                width: 40px;
                height: 40px;
                align-items: center;
                -moz-align-items: center;
                -webkit-align-items: center;
                -o-align-items: center;
                -ms-align-items: center;
                justify-content: center;
                -moz-justify-content: center;
                -webkit-justify-content: center;
                -o-justify-content: center;
                -ms-justify-content: center;
                border-radius: 50%;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                -o-border-radius: 50%;
                -ms-border-radius: 50%;
                background: #ebebeb;
                color: #999;
                margin-right: 15px;
                border: 5px solid #fff;
                font-weight: bold;
            }

            .title .step-text {
                font-weight: bold;
                color: #999;
            }

            .current .title .step-number {
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                color: #fff;
            }

            .current .title .step-text {
                color: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
            }

            .content h3 {
                display: none;
            }

            .content,
            .actions {
/*                background: #f8f8f8;*/
                background-color: white;
            }

            .actions {
                padding-bottom: 90px;
            }

            .actions ul {
                padding-left: 45px;
                padding-right: 55px;
            }

            .actions ul .disabled {
                display: none;
            }

            .actions ul li {
                float: right;
            }

            .actions ul li:first-child {
                float: left;
            }

            .actions ul li:first-child a {
                background: #e8e8e8;
                color: #999;
            }

            .actions ul li a {
                width: 140px;
                height: 50px;
                color: #fff;
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                align-items: center;
                -moz-align-items: center;
                -webkit-align-items: center;
                -o-align-items: center;
                -ms-align-items: center;
                justify-content: center;
                -moz-justify-content: center;
                -webkit-justify-content: center;
                -o-justify-content: center;
                -ms-justify-content: center;
                text-decoration: none;
            }

            .form-radio-flex {
                flex-wrap: wrap;
                -moz-flex-wrap: wrap;
                -webkit-flex-wrap: wrap;
                -o-flex-wrap: wrap;
                -ms-flex-wrap: wrap;
                margin: 0 -15px;
            }

            .form-radio-flex .form-radio-item {
                padding: 0 15px;
                margin-bottom: 25px;
            }

            .form-radio-flex input {
                width: 0;
                height: 0;
                position: absolute;
                left: -9999px;
            }

            .form-radio-flex input+label {
                margin: 0px;
                width: 223px;
                height: 133px;
                box-sizing: border-box;
                position: relative;
                display: inline-block;
                text-align: center;
                background-color: transparent;
                border: 1px solid transparent;
                text-align: center;
                text-transform: none;
                transition: border-color .15s ease-out, color .25s ease-out, background-color .15s ease-out, box-shadow .15s ease-out;
            }

            .form-radio-flex input+label img {
                width: 100%;
                height: 100%;
            }

            .form-radio-flex input:checked+label {
                border: 1px solid linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                z-index: 1;
            }

            .form-radio-flex input:focus+label {
                outline: none;
            }

            .form-radio-flex input:hover {
                border: 1px solid linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
            }

            label.error {
                display: block;
                position: absolute;
                top: 0px;
                right: 0;
            }

            label.error:after {
                font-family: 'Material-Design-Iconic-Font';
                position: absolute;
                content: '\f135';
                right: 20px;
                top: 50px;
                font-size: 13px;
                color: #f63726;
            }

            input.error {
                border: 1px solid #f63726;
            }

            #find_bank {
                padding: 0 55px;
                width: 680px;
                margin-right: 20px;
            }

            #find_bank::-webkit-input-placeholder {
                font-weight: 400;
            }

            #find_bank::-moz-placeholder {
                font-weight: 400;
            }

            #find_bank:-ms-input-placeholder {
                font-weight: 400;
            }

            #find_bank:-moz-placeholder {
                font-weight: 400;
            }

            .submit {
                width: 150px;
                background: #666;
                color: #fff;
                font-weight: 400;
                cursor: pointer;
            }

            .submit:hover {
                background-color: #4d4d4d;
            }

            .form-find {
                position: relative;
                padding-bottom: 70px;
                border-bottom: 1px solid #ebebeb;
            }

            .form-icon {
                position: absolute;
                top: 12px;
                left: 20px;
                font-size: 18px;
                color: #999;
            }

            .choose-bank-desc {
                color: #666;
                margin: 0px;
                padding-top: 30px;
                padding-bottom: 35px;
            }

            #slider-margin {
                height: 9px;
                border: none;
                box-shadow: none;
                -moz-box-shadow: none;
                -webkit-box-shadow: none;
                -o-box-shadow: none;
                -ms-box-shadow: none;
                background: #e8e8e8;
                border-radius: 0px;
                -moz-border-radius: 0px;
                -webkit-border-radius: 0px;
                -o-border-radius: 0px;
                -ms-border-radius: 0px;
                position: relative;
                margin-top: 110px;
            }

            #slider-margin .noUi-marker-horizontal.noUi-marker-large,
            #slider-margin .noUi-marker-horizontal.noUi-marker {
                height: 0px;
            }

            #slider-margin .noUi-connect {
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
            }

            #slider-margin .noUi-connects {
                border-radius: 0px;
                -moz-border-radius: 0px;
                -webkit-border-radius: 0px;
                -o-border-radius: 0px;
                -ms-border-radius: 0px;
            }

            #slider-margin .noUi-handle {
                width: 15px;
                height: 30px;
                top: -12px;
                background: #e8e8e8;
                outline: none;
                border: none;
                right: -15px;
                border: 1px solid linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                border-radius: 0px;
            }

            #slider-margin .noUi-handle:after,
            #slider-margin .noUi-handle:before {
                width: 0px;
            }

            #slider-margin .noUi-handle .noUi-tooltip {
                bottom: 33px;
                border: none;
                background: transparent;
                font-size: 16px;
                color: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                padding: 0px;
            }

            #slider-margin .noUi-pips {
                width: 96%;
            }

            #slider-margin .noUi-pips .noUi-value {
                top: -50px;
                font-size: 16px;
                color: #666;
            }

            #slider-margin .noUi-pips .noUi-value:before {
                content: '$';
            }

            #slider-margin .noUi-pips .noUi-value-horizontal {
                transform: none;
                -moz-transform: none;
                -webkit-transform: none;
                -o-transform: none;
                -ms-transform: none;
            }

            .your-money {
                font-size: 16px;
                color: #222;
                margin: 0px;
                padding-top: 62px;
            }

            .your-money .money {
                font-size: 28px;
                font-weight: bold;
            }

            @media screen and (max-width: 1024px) {
                .containerbooking {
                    width: calc(100% - 40px);
                    max-width: 100%;
                }

                .vertical .steps,
                .vertical .content,
                .vertical .actions {
                    float: none;
                    width: 100%;
                }

                #find_bank {
                    width: 100%;
                }

                .form-radio-flex input+label {
                    width: 190px;
                    height: 120px;
                }
            }

            @media screen and (max-width: 992px) {
                .content {
                    height: 900px;
                }

                .form-radio-flex input+label {
                    width: 100px;
                    height: 65px;
                }
            }

            @media screen and (max-width: 768px) {

                #steps-uid-0-p-0 .form-row,
                #steps-uid-0-p-0 .form-group,
                #steps-uid-0-p-0 .form-date {
                    width: 100%;
                }

                .form-flex {
                    flex-direction: column;
                    -moz-flex-direction: column;
                    -webkit-flex-direction: column;
                    -o-flex-direction: column;
                    -ms-flex-direction: column;
                    margin: 0px;
                }

                .form-flex .form-group {
                    margin-left: 12px;
                    padding: 0px;
                }

                fieldset,
                .actions ul {
                    padding-left: 30px;
                    padding-right: 30px;
                }

                #slider-margin .noUi-pips {
                    width: 94%;
                }
            }

            @media screen and (max-width: 480px) {

                .form-date-group,
                .form-find {
                    flex-direction: column;
                    -moz-flex-direction: column;
                    -webkit-flex-direction: column;
                    -o-flex-direction: column;
                    -ms-flex-direction: column;
                }

                .content {
                    height: 1050px;
                }

                #find_bank {
                    margin-bottom: 20px;
                }

                .actions ul li a {
                    width: 100px;
                }

                .form-radio-flex {
                    margin: 0 -5px;
                }

                .form-radio-flex .form-radio-item {
                    padding: 0 5px;
                }

                .form-radio-flex input+label {
                    width: 90px;
                    height: 61px;
                }
            }

            .form-enter {
                background-color: #ebebeb;
                border-radius: 5px;
                box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
                margin: 20px -7px 25px -7px;
                padding: 5px 7px 16px 7px;
            }

            .form-control {
                width: 100%;
                max-width: 600px;
                min-width: 200px;
                max-height: 400px;
                min-height: 100px;
            }

            .form-radio-group {
                justify-content: space-between;
            }

            .form-radio-group label {
                width: 70%;
                display: flex;
            }

            .form-radio-group label input {
                width: 20px;
            }

            .location {
                margin-top: 85px
            }

            select {
                border-radius: 8px;
            }

            .scrollable-vertical {
                width: 100%;
                height: 555px;
                /* border: 1px solid #000; */
                overflow-y: scroll;
                /* Chỉ tạo cuộn dọc */
                overflow-x: hidden;
                /* Ẩn cuộn ngang nếu có */
                padding: 10px;
            }

            .form-box {
                display: inline-flex;
            }

            .form-box,
            .form-box-total {
                background-color: #fff;
                box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
                margin-bottom: 35px;
                padding: 30px;
                width: 94%;
                border-top: 1px black solid;
            }

            .form-img {
                width: 25%;
                padding: 0 5px;
            }

            .form-img img {
                width: 100%;
            }

            .form-text {
                padding: 0 15px;
                width: 50%;
            }

            .scrollable-vertical h4 {
                margin: 12px 0;
                font-size: 16px;
            }

            .form-doc {
                width: 100%;
            }

            .form-doc p {
                margin-top: 0;
                font-size: 12px;
            }

            .form-doc ul li {
                margin-top: 0;
                font-size: 12px;
            }

            .form-check,
            .price-container {
                width: 25%;
                padding: 0 5px;
            }

            .checkbox-container {
                display: flex;
                align-items: center;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f9f9f9;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                width: 92%;
                height: 20px;
            }

            .checkbox-container input[type="checkbox"] {
                margin-right: 10px;
                width: 8%;
            }

            .checkbox-container label {
                font-size: 14px;
                font-weight: bold;
                color: #333;
            }

            .form-box label {
                font-weight: bold;
                color: #333;
            }

            .form-check-select {
                text-align: center;
                width: 28%;
                height: 110%;
                margin-right: 6px;
            }

            .form-comf-50 {
                display: inline-block;
                width: 50%;
                flex-wrap: wrap;
                gap: 30px;
            }

            .form-comf-20 {
                display: inline-flex;
                width: 25%;
                flex-wrap: wrap;
                gap: 60px;
            }

            .item-container {
                width: 100%;
                display: flex;
            }

            .form-comf-70 {
                display: inline-flex;
                width: 65%;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: space-between;
            }

            .form-comf-30 {
                display: inline-flex;
                width: 35%;
                justify-content: space-between;
                /* border-left:1px black solid ; */
                /* flex-wrap: wrap; 
              gap: 20px; */
            }

            .form-comf-text {
                margin-bottom: 20px;
            }

            .form-img-bike {
                width: 35%;
                padding: 0 5px;
            }

            .form-img-bike img {
                width: 100%;
                height: 100%;
            }

            .item-total {
                width: 100%;
                display: flex;
                justify-content: space-between;
                border-top: 2px dotted #666;
                margin-top: 15px;
            }

            .price-container {
                text-align: center;
                font-family: Arial, sans-serif;
            }

            .text-period {
                color: gray;
                margin-left: 5px;
                vertical-align: super;
            }

            .main-price {
                font-size: 20px;
                font-weight: unset;
                margin: 0;
/*                display: inline-block;*/
                display: none;
            }

            .price-note {
                font-size: 0.9em;
                color: gray;
                margin: 5px 0 30px 0;
            }

            .rent-button {
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                color: black;
                border: none;
                padding: 15px 10px;
                font-size: 1em;
                font-weight: bold;
                cursor: pointer;
                border-radius: 2px;
                display: flex;
                width: 100%;
                display: flex;
                justify-content: space-around;
            }

            /*            .rent-button:hover {
                            background-color: #454545;
                            color: white;
                        }*/

            .hidden-next {
                display: block;
            }
            
            .quantity-container {
                display: flex;
                align-items: center;
                width: 100%;
                
/*                justify-content: space-around;*/
                
            }

            .buttonMotor {
                font-size: 16px;
                font-weight: bold;
                text-align: center;
/*                border-radius: 50%; */
/*                border-radius: 5px;*/
                color:white; 
                border-style: none;
            }
            
            #plus{
                background: black;
                height: 20px;
                width: 100%;
                border-bottom: solid;
            }
            #minus{
                background: black;
                height: 20px;
                width: 100%
            }
            #clear{
                background: red;
                height: 40px;
                width: 15%;
            }

            .quantity-container input {
                width: 65%;
                text-align: center;
                border-style: none;
                height: 40px;
            }
            /* Lớp phủ toàn trang */
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5); /* Nền bán trong suốt */
                display: none; /* Ẩn theo mặc định */
                justify-content: center;
                align-items: center;
                z-index: 9999; /* Đảm bảo nằm trên cùng */
            }
            .overlay.active {
                display: flex; /* Hiển thị lớp phủ khi active */
            }
            .overlay span {
                color: #fff;
                font-size: 24px;
            }
            
            label.error{
                color: #dc3545;
                font-size: 11px;
                font-weight: 600;
                margin-top: 4px;
            }
             .note-star{
                color: red;
             }

            /* --- LUXURY OVERRIDES FOR PREMIUM BOOKING EXPERIENCE --- */
            body {
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                background-color: #1a1816 !important;
                color: #2b2824 !important;
                font-weight: 500 !important;
            }
            .main {
                padding: 60px 0 !important;
                background: radial-gradient(circle at top, #2b2824 0%, #121110 100%) !important;
                min-height: 100vh !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
            }
            .container-booking {
                width: 1400px !important;
                max-width: 95% !important;
                background: #ffffff !important;
                border-radius: 20px !important;
                box-shadow: 0 25px 60px rgba(0, 0, 0, 0.45) !important;
                overflow: hidden !important;
                position: relative !important;
                border: 1px solid rgba(181, 147, 73, 0.15) !important;
            }
            
            /* Sleek Close/Exit Button */
            .btn-exit-booking {
                position: absolute !important;
                top: 25px !important;
                right: 35px !important;
                background: rgba(26, 24, 22, 0.05) !important;
                border: 1px solid rgba(26, 24, 22, 0.12) !important;
                color: #1a1816 !important;
                padding: 10px 22px !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 700 !important;
                font-size: 13px !important;
                text-transform: uppercase !important;
                letter-spacing: 1px !important;
                border-radius: 30px !important;
                text-decoration: none !important;
                display: inline-flex !important;
                align-items: center !important;
                gap: 8px !important;
                z-index: 1000 !important;
                transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1) !important;
            }
            .btn-exit-booking i {
                font-size: 14px !important;
                font-weight: 800 !important;
            }
            .btn-exit-booking:hover {
                background: #b59349 !important;
                color: #ffffff !important;
                border-color: #b59349 !important;
                box-shadow: 0 4px 15px rgba(181, 147, 73, 0.3) !important;
                transform: translateY(-2px) !important;
            }
            .btn-exit-booking:active {
                transform: translateY(0) scale(0.96) !important;
            }

            /* Step Sidebar Overhaul */
            .vertical {
                background-color: #ffffff !important;
                display: flex !important;
                flex-direction: row !important;
                width: 100% !important;
                min-height: 850px !important;
            }
            .vertical .steps {
                width: 320px !important;
                background-color: #fbfaf8 !important;
                border-right: 1px solid rgba(181, 147, 73, 0.12) !important;
                padding: 50px 30px !important;
                float: none !important;
            }
            .vertical .content {
                flex: 1 !important;
                float: none !important;
                width: auto !important;
                background-color: #ffffff !important;
                padding: 50px 60px 140px 60px !important;
                height: auto !important;
                min-height: 700px !important;
            }
            .vertical .actions {
                position: absolute !important;
                bottom: 0 !important;
                right: 0 !important;
                width: calc(100% - 320px) !important;
                background-color: #ffffff !important;
                border-top: 1px solid rgba(26, 24, 22, 0.05) !important;
                padding: 25px 60px 40px 60px !important;
                float: none !important;
            }
            
            /* Sidebar step text & timeline */
            .steps ul {
                padding-left: 0 !important;
                padding-top: 0 !important;
                display: flex !important;
                flex-direction: column !important;
                gap: 24px !important;
            }
            .steps ul li {
                padding-bottom: 0 !important;
                margin-bottom: 0 !important;
            }
            .steps ul:after {
                display: none !important; /* Hide outdated static timeline line */
            }
            .title {
                display: flex !important;
                align-items: center !important;
            }
            .title .step-number {
                width: 44px !important;
                height: 44px !important;
                border: 2px solid rgba(181, 147, 73, 0.2) !important;
                background: #ffffff !important;
                color: #b59349 !important;
                font-family: 'Poppins', sans-serif !important;
                font-weight: 700 !important;
                font-size: 15px !important;
                margin-right: 18px !important;
                display: inline-flex !important;
                align-items: center !important;
                justify-content: center !important;
                transition: all 0.3s ease !important;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.02) !important;
            }
            .title .step-text {
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 700 !important;
                font-size: 14px !important;
                color: #7c766f !important;
                letter-spacing: 0.5px !important;
                text-transform: uppercase !important;
                transition: all 0.3s ease !important;
            }
            
            /* Active step indicators */
            .current .title .step-number {
                background: #b59349 !important;
                color: #ffffff !important;
                border-color: #b59349 !important;
                box-shadow: 0 4px 15px rgba(181, 147, 73, 0.3) !important;
            }
            .current .title .step-text {
                color: #1a1816 !important;
            }
            
            /* Fieldset Header Styling */
            fieldset {
                padding: 0 !important;
                margin: 0 !important;
                border: none !important;
            }
            fieldset h2 {
                font-family: 'Poppins', sans-serif !important;
                font-weight: 800 !important;
                font-size: 28px !important;
                letter-spacing: 0.5px !important;
                color: #1a1816 !important;
                margin-bottom: 8px !important;
            }
            fieldset p.desc {
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-size: 14px !important;
                color: #7c766f !important;
                margin-bottom: 35px !important;
            }

            /* Luxury Form Inputs */
            .form-label {
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 700 !important;
                font-size: 12px !important;
                text-transform: uppercase !important;
                letter-spacing: 1px !important;
                color: #5c554e !important;
                margin-bottom: 8px !important;
            }
            input[type="date"], input[type="time"], select, input[type="text"], input[type="email"], input[type="tel"] {
                width: 100% !important;
                height: 48px !important;
                border: 1px solid #e3dec9 !important;
                border-radius: 8px !important;
                padding: 0 16px !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-size: 14px !important;
                color: #1a1816 !important;
                font-weight: 600 !important;
                background-color: #fbfaf8 !important;
                box-sizing: border-box !important;
                transition: all 0.3s ease !important;
            }
            input:focus, select:focus {
                border-color: #b59349 !important;
                background-color: #ffffff !important;
                box-shadow: 0 0 0 4px rgba(181, 147, 73, 0.12) !important;
                outline: none !important;
            }
            
            /* Grid Spacing fixes */
            .form-flex {
                display: grid !important;
                grid-template-columns: 1fr 1fr !important;
                gap: 20px 30px !important;
                margin: 0 !important;
            }
            .form-flex .form-group {
                width: 100% !important;
                padding: 0 !important;
                margin: 0 !important;
            }
            .form-row {
                margin-bottom: 25px !important;
            }
            .form-row.location {
                margin-top: 0 !important;
            }

            /* Step Actions Buttons (Prev, Next, Finish) */
            .actions ul {
                display: flex !important;
                justify-content: flex-end !important;
                gap: 15px !important;
                padding: 0 !important;
                margin: 0 !important;
                list-style: none !important;
                width: 100% !important;
            }
            .actions ul li {
                float: none !important;
            }
            .actions ul li.disabled, .actions ul .disabled {
                display: none !important;
            }
            .actions ul li:first-child {
                margin-right: auto !important;
            }
            .actions ul li a {
                display: inline-flex !important;
                align-items: center !important;
                justify-content: center !important;
                width: 160px !important;
                height: 48px !important;
                border-radius: 8px !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                letter-spacing: 1px !important;
                font-size: 13px !important;
                box-shadow: 0 4px 12px rgba(181, 147, 73, 0.12) !important;
                transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1) !important;
                text-decoration: none !important;
            }
            /* Next/Finish button */
            .actions ul li:not(:first-child) a, .actions ul li a[href="#next"], .actions ul li a[href="#finish"] {
                background: #b59349 !important;
                color: #ffffff !important;
                border: 1px solid #b59349 !important;
            }
            .actions ul li:not(:first-child) a:hover, .actions ul li a[href="#next"]:hover, .actions ul li a[href="#finish"]:hover {
                background: #1a1816 !important;
                color: #b59349 !important;
                border-color: #b59349 !important;
                box-shadow: 0 6px 20px rgba(181, 147, 73, 0.35) !important;
                transform: translateY(-2px) !important;
            }
            .actions ul li:not(:first-child) a:active, .actions ul li a[href="#next"]:active, .actions ul li a[href="#finish"]:active {
                transform: translateY(0) scale(0.97) !important;
            }
            /* Prev button */
            .actions ul li:first-child a, .actions ul li a[href="#previous"] {
                background: #f1ede4 !important;
                color: #5c554e !important;
                border: 1px solid #e3dec9 !important;
            }
            .actions ul li:first-child a:hover, .actions ul li a[href="#previous"]:hover {
                background: #e3dec9 !important;
                color: #1a1816 !important;
                border-color: #c9c2ac !important;
                transform: translateY(-2px) !important;
            }
            .actions ul li:first-child a:active, .actions ul li a[href="#previous"]:active {
                transform: translateY(0) scale(0.97) !important;
            }

            /* Responsive Adjustments */
            @media (max-width: 991px) {
                .vertical {
                    flex-direction: column !important;
                }
                .vertical .steps {
                    width: 100% !important;
                    border-right: none !important;
                    border-bottom: 1px solid rgba(181, 147, 73, 0.12) !important;
                    padding: 30px !important;
                }
                .vertical .content {
                    padding: 30px !important;
                }
                .vertical .actions {
                    position: static !important;
                    width: 100% !important;
                    padding: 20px 30px 30px 30px !important;
                }
                .btn-exit-booking {
                    top: 15px !important;
                    right: 15px !important;
                    padding: 6px 14px !important;
                    font-size: 11px !important;
                }
            }

            /* --- WIZARD FORM CONTENT & CARD POLISHING --- */
            
            /* Hide the clunky raw text headers rendered by jquery-steps */
            #signup-form h3 {
                display: none !important;
            }

            /* Product Listing Card Modernization */
            .form-box, .form-box-total {
                background: #ffffff !important;
                border: 1px solid rgba(181, 147, 73, 0.15) !important;
                border-radius: 16px !important;
                box-shadow: 0 8px 30px rgba(26, 24, 22, 0.03) !important;
                margin-bottom: 25px !important;
                padding: 24px !important;
                width: 100% !important;
                box-sizing: border-box !important;
                transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1) !important;
                display: flex !important;
                flex-direction: row !important;
                align-items: center !important;
                gap: 24px !important;
            }
            .form-box:hover {
                border-color: #b59349 !important;
                box-shadow: 0 12px 35px rgba(181, 147, 73, 0.1) !important;
                transform: translateY(-3px) !important;
            }
            .form-img-bike, .form-img {
                width: 200px !important;
                height: 135px !important;
                flex-shrink: 0 !important;
                border-radius: 12px !important;
                overflow: hidden !important;
                background: #fbfaf8 !important;
                border: 1px solid rgba(181, 147, 73, 0.08) !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
            }
            .form-img-bike img, .form-img img {
                width: 100% !important;
                height: 100% !important;
                object-fit: contain !important;
                transition: transform 0.5s cubic-bezier(0.16, 1, 0.3, 1) !important;
            }
            .form-box:hover .form-img-bike img, .form-box:hover .form-img img {
                transform: scale(1.06) !important;
            }
            .form-text {
                flex: 1 !important;
                padding: 0 !important;
                width: auto !important;
            }
            .motor-name {
                font-family: 'Poppins', sans-serif !important;
                font-weight: 700 !important;
                font-size: 20px !important;
                color: #1a1816 !important;
                margin-top: 0 !important;
                margin-bottom: 8px !important;
            }
            .form-doc {
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-size: 13px !important;
                color: #6c665f !important;
                line-height: 1.6 !important;
            }
            .form-doc p {
                margin: 0 0 6px 0 !important;
            }
            .form-doc ul {
                margin: 0 !important;
                padding-left: 18px !important;
            }
            .form-doc ul li {
                font-size: 13px !important;
                color: #6c665f !important;
                margin-bottom: 4px !important;
            }

            /* Checkout Dynamic Price Displays */
            .form-check {
                width: 250px !important;
                flex-shrink: 0 !important;
                display: flex !important;
                flex-direction: column !important;
                align-items: flex-end !important;
                justify-content: center !important;
                gap: 12px !important;
                padding: 0 !important;
            }
            .main-price {
                font-family: 'Poppins', sans-serif !important;
                font-weight: 700 !important;
                font-size: 22px !important;
                color: #b59349 !important;
                margin: 0 !important;
                letter-spacing: 0.5px !important;
                text-align: right !important;
                /* Let JS dynamic controls handle the display property naturally */
            }
            .price-note {
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-size: 11px !important;
                color: #9c968f !important;
                margin: 0 !important;
                text-align: right !important;
            }

            /* Sleek Quantity Selector (Replaced clunky blue-cyan buttons) */
            .rent-button {
                background: #1a1816 !important;
                border: 1px solid #b59349 !important;
                border-radius: 8px !important;
                padding: 8px 14px !important;
                color: #ffffff !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 700 !important;
                font-size: 12px !important;
                display: inline-flex !important;
                align-items: center !important;
                gap: 12px !important;
                justify-content: space-between !important;
                width: auto !important;
                min-width: 200px !important;
                box-sizing: border-box !important;
            }
            .rent-button a {
                color: #ffffff !important;
                text-decoration: none !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 700 !important;
                letter-spacing: 0.5px !important;
            }
            .form-check-select {
                background-color: #ffffff !important;
                border: 1px solid #e3dec9 !important;
                border-radius: 6px !important;
                color: #1a1816 !important;
                font-weight: 700 !important;
                height: 30px !important;
                padding: 0 6px !important;
                width: 65px !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-size: 13px !important;
                cursor: pointer !important;
            }

            /* Accessory Checkbox Containers (Step 3) */
            .checkbox-container {
                display: inline-flex !important;
                align-items: center !important;
                gap: 12px !important;
                background: #fbfaf8 !important;
                border: 1px solid #e3dec9 !important;
                border-radius: 8px !important;
                padding: 8px 16px !important;
                height: 48px !important;
                width: auto !important;
                box-shadow: none !important;
                box-sizing: border-box !important;
            }
            .checkbox-container label {
                font-family: 'Poppins', sans-serif !important;
                font-weight: 700 !important;
                font-size: 14px !important;
                color: #b59349 !important;
                margin: 0 !important;
            }
            .checkbox-container .items-free {
                color: #2e7d32 !important;
            }

            /* Custom Modern Segmented Radios for Gender (Step 4) */
            .form-radio-group {
                display: flex !important;
                gap: 10px !important;
                width: 100% !important;
                height: 48px !important;
                align-items: center !important;
            }
            .form-radio-group label {
                flex: 1 !important;
                display: inline-flex !important;
                align-items: center !important;
                justify-content: center !important;
                gap: 8px !important;
                background: #fbfaf8 !important;
                border: 1px solid #e3dec9 !important;
                border-radius: 8px !important;
                height: 100% !important;
                cursor: pointer !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 700 !important;
                font-size: 13px !important;
                color: #5c554e !important;
                transition: all 0.3s ease !important;
                margin: 0 !important;
                width: auto !important;
                box-sizing: border-box !important;
            }
            .form-radio-group label:hover {
                border-color: #b59349 !important;
                background: #ffffff !important;
            }
            .form-radio-group label input[type="radio"] {
                width: 16px !important;
                height: 16px !important;
                margin: 0 !important;
                accent-color: #b59349 !important;
                cursor: pointer !important;
            }
            .form-radio-group label:has(input:checked) {
                border-color: #b59349 !important;
                background: #fdfaf2 !important;
                color: #b59349 !important;
                box-shadow: 0 0 0 3px rgba(181, 147, 73, 0.1) !important;
            }

            /* CCCD Document Upload Container Overhaul */
            .form-enter {
                background-color: #fcfbfa !important;
                border: 1px solid rgba(181, 147, 73, 0.22) !important;
                border-radius: 14px !important;
                box-shadow: 0 8px 24px rgba(181, 147, 73, 0.03) !important;
                margin: 25px 0 !important;
                padding: 24px !important;
                box-sizing: border-box !important;
            }
            .form-enter .form-flex {
                display: grid !important;
                grid-template-columns: 2fr 1fr 1fr 2fr !important;
                gap: 20px !important;
                align-items: end !important;
                margin: 0 !important;
                width: 100% !important;
            }
            .form-enter .form-flex > div {
                width: 100% !important;
                padding: 0 !important;
                margin: 0 !important;
            }
            .form-enter .form-flex .form-group {
                width: 100% !important;
                padding: 0 !important;
                margin: 0 !important;
            }
            /* Restructure the inner flexbox for Issued date and Expiry date into columns */
            .form-enter .form-flex > div[style*="display: flex"] {
                display: grid !important;
                grid-template-columns: 1fr 1fr !important;
                gap: 15px !important;
            }
            .form-enter input[type="file"] {
                padding: 10px 14px !important;
                font-size: 13px !important;
                height: 48px !important;
                box-sizing: border-box !important;
                background: #ffffff !important;
                border: 1px solid #e3dec9 !important;
                border-radius: 8px !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                color: #5c554e !important;
                cursor: pointer !important;
            }

            /* Responsive Adjustments for Cards & Steps */
            @media (max-width: 768px) {
                .form-box {
                    flex-direction: column !important;
                    align-items: stretch !important;
                }
                .form-img-bike, .form-img {
                    width: 100% !important;
                    height: 180px !important;
                }
                .form-check {
                    width: 100% !important;
                    align-items: stretch !important;
                }
                .main-price, .price-note {
                    text-align: left !important;
                }
                .form-enter .form-flex {
                    grid-template-columns: 1fr !important;
                    gap: 16px !important;
                }
                .form-enter .form-flex > div[style*="display: flex"] {
                    grid-template-columns: 1fr 1fr !important;
                }
            }
        </style>
        
    </head>

    <body>
<!--        <div id="navbar-container"></div>-->

        <div class="overlay" id="overlay">
            <span>Đang xử lý...</span>
        </div>
        <div class="main">
          
            <div class="container-booking">
                <!-- Sleek Exit Booking Button -->
                <a href="javascript:void(0)" onclick="let ref = document.referrer; if(ref.includes('login') || ref.includes('register')) { window.location.href='home'; } else if(ref.includes(window.location.host)) { window.location.href=ref; } else { window.location.href='home'; }" class="btn-exit-booking" title="Hủy đặt xe và quay lại">
                    <i class="bi bi-x-lg"></i> Hủy đặt xe
                </a>
              
                <form method="POST" id="signup-form" class="signup-form" action="" onkeydown="return event.key !== 'Enter' || event.target.tagName === 'TEXTAREA';"
                    onsubmit="return false;">
                    
                    <div >
                        <button type="submit" id="paymentButton" style="display: none"></button>
                        <h3>Ngày giờ</h3>
                        <fieldset>
                            <h2>NGÀY & GIỜ</h2>
                            <p class="desc">Hãy lựa chọn ngày giờ và địa điểm bạn muốn giao / trả xe</p>
                            <div class="form-row">
                                <div class="form-flex">
                                    <div class="form-group">
                                        <label for="pickupdate" class="form-label">Ngày nhận xe <span class="note-star"> *</span></label>
                                        <input type="date" name="pickupdate" id="pickupdate" />
                                    </div>
                                    <div class="form-group">
                                        <label for="pickuptime" class="form-label">Giờ nhận xe <span class="note-star"> *</span></label>
                                        <input type="time" name="pickuptime" id="pickuptime"  />
                                        <small style="color: #888; font-size: 12px; margin-top: 5px; display: block;">* Giờ hoạt động: 07:00 - 23:00</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="returndate" class="form-label">Ngày trả xe <span class="note-star"> *</span></label>
                                        <input type="date" name="returndate" id="returndate"  />
                                        <div style="margin-top: 10px; display: flex; flex-wrap: wrap; align-items: center; gap: 8px;">
                                            <button type="button" id="btn-quick-week" style="background: #fff; color: #b59349; border: 1.5px solid #b59349; padding: 5px 14px; font-size: 12px; font-weight: 600; border-radius: 20px; cursor: pointer; transition: all 0.2s;" onclick="setQuickReturnDate(7)">
                                                Thuê 1 Tuần &mdash; Giá ưu đãi hơn so với ngày lẻ
                                            </button>
                                            <button type="button" id="btn-quick-month" style="background: #fff; color: #b59349; border: 1.5px solid #b59349; padding: 5px 14px; font-size: 12px; font-weight: 600; border-radius: 20px; cursor: pointer; transition: all 0.2s;" onclick="setQuickReturnDate(30)">
                                                Thuê 1 Tháng &mdash; Giá ưu đãi tốt nhất
                                            </button>
                                        </div>
                                        <small style="display: block; margin-top: 6px; color: #888; font-size: 11px; font-style: italic;">
                                            💡 Nhấn vào gói để tự động điền ngày trả xe &amp; áp dụng giá ưu đãi ở bước Chọn Xe
                                        </small>
                                    </div>
                                    <div class="form-group">
                                        <label for="returntime" class="form-label">Giờ trả xe <span class="note-star"> *</span></label>
                                        <input type="time" name="returntime" id="returntime" />
                                        <small style="color: #888; font-size: 12px; margin-top: 5px; display: block;">* Giờ hoạt động: 07:00 - 23:00</small>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row location">
                                <div class="form-flex">
                                    <div class="form-group">
                                        <label for="pickuplocation" class="form-label">Địa điểm nhận xe <span class="note-star"> *</span></label>
                                        <select name="pickuplocation" id="pickuplocation" class="form-label">
                                            <option value="Ga Đà Nẵng - Số 202 đường Hải Phòng">Ga Đà Nẵng – 202 Hải Phòng, Tam Thuận</option>
                                            <option value="Sân bay Quốc tế Đà Nẵng - 132 Phan Đình Phùng">✈ Sân bay Đà Nẵng – 132 Phan Đình Phùng</option>
                                            <option value="Bến xe Trung tâm - 33 Tôn Đức Thắng">Bến xe Trung tâm – 33 Tôn Đức Thắng, Hải Châu</option>
                                            <option value="Chợ Hàn - 119 Trần Phú">Chợ Hàn – 119 Trần Phú, Hải Châu</option>
                                            <option value="Vincom Plaza - 910A Ngô Quyền">Vincom Plaza – 910A Ngô Quyền, Sơn Trà</option>
                                            <option value="Cầu Rồng - Trần Hưng Đạo">Cầu Rồng – Trần Hưng Đạo, Hải Châu</option>
                                            <option value="Ngũ Hành Sơn - Huyền Trân Công Chúa">Ngũ Hành Sơn – Huyền Trân Công Chúa</option>
                                            <option value="Lotte Mart - 6 Nại Nam">Lotte Mart – 6 Nại Nam, Hải Châu</option>
                                            <option value="Phố đi bộ Bạch Đằng - Bạch Đằng">Phố đi bộ Bạch Đằng, Hải Châu</option>
                                            <option value="Bệnh viện Đà Nẵng - 124 Hải Phòng">Bệnh viện Đà Nẵng – 124 Hải Phòng</option>
                                            <option value="Your own address">✏️ Địa chỉ của bạn (tự nhập)</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="returnlocation" class="form-label">Địa điểm trả xe <span class="note-star"> *</span></label>
                                        <select name="returnlocation" id="returnlocation" class="form-label">
                                            <option value="Ga Đà Nẵng - Số 202 đường Hải Phòng">Ga Đà Nẵng – 202 Hải Phòng, Tam Thuận</option>
                                            <option value="Sân bay Quốc tế Đà Nẵng - 132 Phan Đình Phùng">✈ Sân bay Đà Nẵng – 132 Phan Đình Phùng</option>
                                            <option value="Bến xe Trung tâm - 33 Tôn Đức Thắng">Bến xe Trung tâm – 33 Tôn Đức Thắng, Hải Châu</option>
                                            <option value="Chợ Hàn - 119 Trần Phú">Chợ Hàn – 119 Trần Phú, Hải Châu</option>
                                            <option value="Vincom Plaza - 910A Ngô Quyền">Vincom Plaza – 910A Ngô Quyền, Sơn Trà</option>
                                            <option value="Cầu Rồng - Trần Hưng Đạo">Cầu Rồng – Trần Hưng Đạo, Hải Châu</option>
                                            <option value="Ngũ Hành Sơn - Huyền Trân Công Chúa">Ngũ Hành Sơn – Huyền Trân Công Chúa</option>
                                            <option value="Lotte Mart - 6 Nại Nam">Lotte Mart – 6 Nại Nam, Hải Châu</option>
                                            <option value="Phố đi bộ Bạch Đằng - Bạch Đằng">Phố đi bộ Bạch Đằng, Hải Châu</option>
                                            <option value="Bệnh viện Đà Nẵng - 124 Hải Phòng">Bệnh viện Đà Nẵng – 124 Hải Phòng</option>
                                            <option value="Your own address">✏️ Địa chỉ của bạn (tự nhập)</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <h3>Xe máy</h3>
                        <fieldset>
                            <h2>CHỌN XE MÁY</h2>
                            <p class="desc">Hãy chọn những chiếc xe tuyệt vời nhất cho hành trình của bạn</p>
                            
                            <div class="fieldset-content">
                                <!-- Banner xe đã chọn realtime -->
                                <div id="bike-selection-banner" style="display:none; background: linear-gradient(135deg,#fdf8ee,#fff8e1); border:1.5px solid #e0c87a; border-radius:10px; padding:10px 16px; margin-bottom:14px; font-size:13px; color:#7a5c00; font-weight:600;">
                                    <i class="bi bi-check-circle-fill" style="color:#b59349;"></i>
                                    Đã chọn: <span id="bike-selection-list"></span>
                                </div>
                                <div class="scrollable-vertical" id="motorcyclelist">
                                    <c:forEach items="${listM}" var="o">
                                        <c:if test="${o.motorcycleId eq chosenmotor}">
                                            <div class="form-box">
                                                <div class="form-img-bike">
                                                    <label style="width: 100%" for="body-bg"><img src="${empty o.image ? 'images/default.jpg' : (o.image.startsWith('http') ? o.image : 'images/'.concat(o.image))}" alt=""></label>
                                                </div>
                                                <div class="form-text">
                                                    <h4 class="motor-name">${o.model} ${o.displacement}</h4>
                                                    <div class="form-doc" style="box-sizing: border-box;">
                                                        ${o.description}
                                                    </div>
                                                </div>
                                                <div class="form-check"> 
                                                    <c:forEach items="${listP}" var="p">
                                                        <c:if test="${p.priceListId eq o.priceListID}">
                                                            <c:choose>
                                                                <c:when test="${not empty activeEvent and activeEvent.discount > 0}">
                                                                    <div style="display: flex; gap: 8px; align-items: baseline;">
                                                                        <fmt:formatNumber var="origDay" value="${p.dailyPriceForDay}" maxFractionDigits="0" groupingUsed="true"/>
                                                                        <span style="text-decoration: line-through; color: #999; font-size: 16px;">₫${origDay}</span>
                                                                        <span style="color: #dc2626; font-size: 14px; font-weight: bold; padding: 2px 6px; background: #fee2e2; border-radius: 4px;">Giảm <fmt:formatNumber value="${activeEvent.discount * 100}" maxFractionDigits="0"/>%</span>
                                                                    </div>
                                                                    <fmt:formatNumber var="discountedDay" value="${p.dailyPriceForDay * (1 - activeEvent.discount)}" maxFractionDigits="0" groupingUsed="true" />
                                                                    <fmt:formatNumber var="discountedWeek" value="${p.dailyPriceForWeek * (1 - activeEvent.discount)}" maxFractionDigits="0" groupingUsed="true" />
                                                                    <fmt:formatNumber var="discountedMonth" value="${p.dailyPriceForMonth * (1 - activeEvent.discount)}" maxFractionDigits="0" groupingUsed="true" />
                                                                    <fmt:formatNumber var="discountedDayRaw" value="${p.dailyPriceForDay * (1 - activeEvent.discount)}" maxFractionDigits="0" groupingUsed="false" />
                                                                    <fmt:formatNumber var="discountedWeekRaw" value="${p.dailyPriceForWeek * (1 - activeEvent.discount)}" maxFractionDigits="0" groupingUsed="false" />
                                                                    <fmt:formatNumber var="discountedMonthRaw" value="${p.dailyPriceForMonth * (1 - activeEvent.discount)}" maxFractionDigits="0" groupingUsed="false" />
                                                                    <h2 class="main-price price-day" data-rawprice="${discountedDayRaw}">₫${discountedDay}/Ngày</h2>
                                                                    <h2 class="main-price price-week" data-rawprice="${discountedWeekRaw}">₫${discountedWeek}/Ngày</h2>
                                                                    <h2 class="main-price price-month" data-rawprice="${discountedMonthRaw}">₫${discountedMonth}/Ngày</h2>
                                                                    <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-start;">
                                                                        <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần (&ge;7 ngày): ₫${discountedWeek}/ngày</span>
                                                                        <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng (&ge;30 ngày): ₫${discountedMonth}/ngày</span>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <fmt:formatNumber var="fmtDay" value="${p.dailyPriceForDay}" maxFractionDigits="0" groupingUsed="true"/>
                                                                    <fmt:formatNumber var="fmtWeek" value="${p.dailyPriceForWeek}" maxFractionDigits="0" groupingUsed="true"/>
                                                                    <fmt:formatNumber var="fmtMonth" value="${p.dailyPriceForMonth}" maxFractionDigits="0" groupingUsed="true"/>
                                                                    <fmt:formatNumber var="rawDay" value="${p.dailyPriceForDay}" maxFractionDigits="0" groupingUsed="false"/>
                                                                    <fmt:formatNumber var="rawWeek" value="${p.dailyPriceForWeek}" maxFractionDigits="0" groupingUsed="false"/>
                                                                    <fmt:formatNumber var="rawMonth" value="${p.dailyPriceForMonth}" maxFractionDigits="0" groupingUsed="false"/>
                                                                    <h2 class="main-price price-day" data-rawprice="${rawDay}">₫${fmtDay}/Ngày</h2>
                                                                    <h2 class="main-price price-week" data-rawprice="${rawWeek}">₫${fmtWeek}/Ngày</h2>
                                                                    <h2 class="main-price price-month" data-rawprice="${rawMonth}">₫${fmtMonth}/Ngày</h2>
                                                                    <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-start;">
                                                                        <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần (&ge;7 ngày): ₫${fmtWeek}/ngày</span>
                                                                        <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng (&ge;30 ngày): ₫${fmtMonth}/ngày</span>
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </c:forEach>                                             
                                                    <p class="price-note">Không bao gồm thuế và bảo hiểm</p>                                                    
                                                        <input style="display: none" type="checkbox"  id="daily-checkbox-${o.motorcycleId}" class="option-checkbox">
                                                        <div class="rent-button">                                                     
                                                            <c:set var="found" value="false" />
                                                            <c:forEach var="entry" items="${listMA}">
                                                                <c:if test="${entry.key eq o.motorcycleId}">
                                                                    <c:set var="found" value="true" />
                                                                    <a>Chọn số lượng xe: </a>
                                                                    <select class="form-check-select" id="daily-select-${o.motorcycleId}">
                                                                        <c:forEach begin="0" end="${entry.value}" var="i">
                                                                            <option value="${i}" ${i == "1" ? 'selected' : ''}>${i}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${found eq false}">
                                                                <a>Hết xe</a>
                                                            </c:if>
                                                        </div>
                                                </div>                                                         
                                            </div>
                                           
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items="${listM}" var="o">
                                        <c:if test="${o.motorcycleId ne chosenmotor}">
                                            <div class="form-box">
                                                <div class="form-img-bike">
                                                    <label style="width: 100%" for="body-bg"><img src="${empty o.image ? 'images/default.jpg' : (o.image.startsWith('http') ? o.image : 'images/'.concat(o.image))}" alt=""></label>
                                                </div>
                                                <div class="form-text">
                                                    <h4 class="motor-name">${o.model} ${o.displacement}</h4>
                                                    <div class="form-doc" style="box-sizing: border-box;">
                                                        ${o.description}
                                                    </div>
                                                </div>
                                                <div class="form-check"> 
                                                    <c:forEach items="${listP}" var="p">
                                                        <c:if test="${p.priceListId eq o.priceListID}">
                                                            <c:choose>
                                                                <c:when test="${not empty activeEvent and activeEvent.discount > 0}">
                                                                    <div style="display: flex; gap: 8px; align-items: baseline;">
                                                                        <fmt:formatNumber var="origDay2" value="${p.dailyPriceForDay}" maxFractionDigits="0" groupingUsed="true"/>
                                                                        <span style="text-decoration: line-through; color: #999; font-size: 16px;">₫${origDay2}</span>
                                                                        <span style="color: #dc2626; font-size: 14px; font-weight: bold; padding: 2px 6px; background: #fee2e2; border-radius: 4px;">Giảm <fmt:formatNumber value="${activeEvent.discount * 100}" maxFractionDigits="0"/>%</span>
                                                                    </div>
                                                                    <fmt:formatNumber var="discountedDay" value="${p.dailyPriceForDay * (1 - activeEvent.discount)}" maxFractionDigits="0" groupingUsed="true" />
                                                                    <fmt:formatNumber var="discountedWeek" value="${p.dailyPriceForWeek * (1 - activeEvent.discount)}" maxFractionDigits="0" groupingUsed="true" />
                                                                    <fmt:formatNumber var="discountedMonth" value="${p.dailyPriceForMonth * (1 - activeEvent.discount)}" maxFractionDigits="0" groupingUsed="true" />
                                                                    <fmt:formatNumber var="discountedDayRaw2" value="${p.dailyPriceForDay * (1 - activeEvent.discount)}" maxFractionDigits="0" groupingUsed="false" />
                                                                    <fmt:formatNumber var="discountedWeekRaw2" value="${p.dailyPriceForWeek * (1 - activeEvent.discount)}" maxFractionDigits="0" groupingUsed="false" />
                                                                    <fmt:formatNumber var="discountedMonthRaw2" value="${p.dailyPriceForMonth * (1 - activeEvent.discount)}" maxFractionDigits="0" groupingUsed="false" />
                                                                    <h2 class="main-price price-day" data-rawprice="${discountedDayRaw2}">₫${discountedDay}/Ngày</h2>
                                                                    <h2 class="main-price price-week" data-rawprice="${discountedWeekRaw2}">₫${discountedWeek}/Ngày</h2>
                                                                    <h2 class="main-price price-month" data-rawprice="${discountedMonthRaw2}">₫${discountedMonth}/Ngày</h2>
                                                                    <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-start;">
                                                                        <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần (&ge;7 ngày): ₫${discountedWeek}/ngày</span>
                                                                        <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng (&ge;30 ngày): ₫${discountedMonth}/ngày</span>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <fmt:formatNumber var="fmtDay2" value="${p.dailyPriceForDay}" maxFractionDigits="0" groupingUsed="true"/>
                                                                    <fmt:formatNumber var="fmtWeek2" value="${p.dailyPriceForWeek}" maxFractionDigits="0" groupingUsed="true"/>
                                                                    <fmt:formatNumber var="fmtMonth2" value="${p.dailyPriceForMonth}" maxFractionDigits="0" groupingUsed="true"/>
                                                                    <fmt:formatNumber var="rawDay2" value="${p.dailyPriceForDay}" maxFractionDigits="0" groupingUsed="false"/>
                                                                    <fmt:formatNumber var="rawWeek2" value="${p.dailyPriceForWeek}" maxFractionDigits="0" groupingUsed="false"/>
                                                                    <fmt:formatNumber var="rawMonth2" value="${p.dailyPriceForMonth}" maxFractionDigits="0" groupingUsed="false"/>
                                                                    <h2 class="main-price price-day" data-rawprice="${rawDay2}">₫${fmtDay2}/Ngày</h2>
                                                                    <h2 class="main-price price-week" data-rawprice="${rawWeek2}">₫${fmtWeek2}/Ngày</h2>
                                                                    <h2 class="main-price price-month" data-rawprice="${rawMonth2}">₫${fmtMonth2}/Ngày</h2>
                                                                    <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-start;">
                                                                        <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần (&ge;7 ngày): ₫${fmtWeek2}/ngày</span>
                                                                        <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng (&ge;30 ngày): ₫${fmtMonth2}/ngày</span>
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </c:forEach>                                             
                                                    <p class="price-note">Không bao gồm thuế và bảo hiểm</p>                                                                                             
                                                        <input style="display: none" type="checkbox"  id="daily-checkbox-${o.motorcycleId}" class="option-checkbox">
                                                        <div class="rent-button">                                                     
                                                            <c:set var="found" value="false" />
                                                            <c:forEach var="entry" items="${listMA}">
                                                                <c:if test="${entry.key eq o.motorcycleId}">
                                                                    <c:set var="found" value="true" />
                                                                    <a>Chọn số lượng xe: </a>
                                                                    <select class="form-check-select" id="daily-select-${o.motorcycleId}">
                                                                        <c:forEach begin="0" end="${entry.value}" var="i">
                                                                            <option value="${i}">${i}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${found eq false}">
                                                                <a>Hết xe</a>
                                                            </c:if>
                                                        </div>
                                                </div>                                                         
                                            </div>
                                        </c:if>
                                    </c:forEach>                                  
                                </div>
                            </div>
                        </fieldset>

                        <h3>Phụ kiện đi kèm</h3>
                        <fieldset>
                            <h2>PHỤ KIỆN ĐI KÈM</h2>
                            <p class="desc">Hãy chọn những phụ kiện có thể giúp ích cho hành trình của bạn</p>
                            <div class="fieldset-content">
                                <!-- Banner phụ kiện đã chọn realtime -->
                                <div id="acc-selection-banner" style="display:none; background: linear-gradient(135deg,#f0fdf4,#e8fce8); border:1.5px solid #86efac; border-radius:10px; padding:10px 16px; margin-bottom:14px; font-size:13px; color:#166534; font-weight:600;">
                                    <i class="bi bi-bag-check-fill" style="color:#16a34a;"></i>
                                    Phụ kiện đã chọn: <span id="acc-selection-list"></span>
                                </div>
                                <div class="scrollable-vertical" id="protection">
<!--                                <h4>SERVICES</h4>
                                <div class="form-box">
                                    <div class="form-img">
                                        <label for="body-bg"><img src="images/body-bg.jpg" alt=""></label>
                                    </div>
                                    <div class="form-text">
                                        <h4>Xe đi đường dài</h4>
                                        <div class="form-doc" style="box-sizing: border-box;">
                                            <p>Khoản ph&iacute; n&agrave;y sẽ&nbsp;&aacute;p dụng&nbsp;cho c&aacute;c kh&aacute;ch h&agrave;ng
                                                sử dụng xe một trong trường hợp sau:</p>
                                            <ul>
                                                <li>Kh&aacute;ch thu&ecirc; xe đi&nbsp;đường d&agrave;i, ra khỏi nội th&agrave;nh Da Nang</li>
                                                <li>Xe đi phượt&nbsp;c&aacute;c tỉnh hoặc đến c&aacute;c địa h&igrave;nh v&ugrave;ng n&uacute;i.
                                                </li>
                                            </ul>
                                            <p>Lưu &yacute;: Đối với c&aacute;c kh&aacute;ch&nbsp;đi đường d&agrave;i chưa lựa
                                                chọn&nbsp;g&oacute;i ph&aacute;t sinh n&agrave;y, khi trả xe COLORMOTOR sẽ thu bổ sung của
                                                kh&aacute;ch. Để biết th&ecirc;m chi tiết&nbsp;vui l&ograve;ng li&ecirc;n hệ <a
                                                    href="tel:0338023344">0338.02.33.44</a> để được giải đ&aacute;p.</p>
                                        </div>
                                    </div>
                                    <div class="form-check">
                                        <div class="checkbox-container">
                                            <input type="checkbox" id="daily-checkbox-1" class="option-checkbox">
                                            <label for="daily-checkbox">₫50.000/Day</label>
                                        </div>
                                    </div>
                                </div>
                                <h4>PROTECTIONS & COVERAGES</h4>
                                <div class="form-box">
                                    <div class="form-img">
                                        <label for="body-bg"><img src="images/baohiemhonghocxe.png" alt=""></label>
                                    </div>
                                    <div class="form-text">
                                        <h4>Bảo hiểm hỏng hóc 50k/ngày Yamaha Sirius & Honda Vision</h4>
                                        <div class="form-doc" style="box-sizing: border-box;">
                                            <p>Ph&iacute;&nbsp;50.000đ/ng&agrave;y &aacute;p dụng cho d&ograve;ng xe Honda Airblade 125cc
                                                v&agrave; Winner 150cc</p>
                                            <p>Khoản ph&iacute; n&agrave;y sẽ&nbsp;&aacute;p dụng&nbsp;cho c&aacute;c kh&aacute;ch h&agrave;ng
                                                sử dụng xe một trong trường hợp sau:</p>
                                            <ul>
                                                <li>G&oacute;i bảo hiểm &aacute;p dụng cho trường hợp kh&aacute;ch đi chuyển gặp bất kỳ vấn đề
                                                    g&igrave; hư hỏng&nbsp;li&ecirc;n quan đến xe m&aacute;y đang thu&ecirc;, sẽ được chi trả 100%
                                                    số tiền sửa chữa bao gồm cả vấn đề va chạm, tai nạn hư hại về xe.</li>
                                            </ul>
                                            <p>Lưu &yacute;: Đối với c&aacute;c kh&aacute;ch&nbsp;đi đường d&agrave;i n&ecirc;n&nbsp;lựa
                                                chọn&nbsp;g&oacute;i ph&aacute;t sinh n&agrave;y&nbsp;để an to&agrave;n v&agrave; y&ecirc;n
                                                t&acirc;m trong qu&aacute; tr&igrave;nh đi phượt,...</p>
                                        </div>
                                    </div>
                                    <div class="form-check">
                                        <div class="checkbox-container">
                                            <input type="checkbox" id="daily-checkbox-2" class="option-checkbox">
                                            <label for="daily-checkbox">₫50.000/Day</label>
                                        </div>
                                    </div>
                                </div>-->


<!--                                <h4>EQUIPMENTS</h4>-->
                                <c:forEach items="${listA}" var="a">
                                    <div class="form-box">
                                        <div class="form-img">
                                            <label for="body-bg"><img src="${empty a.accessoryImage ? 'images/default.jpg' : (a.accessoryImage.startsWith('http') ? a.accessoryImage : 'images/'.concat(a.accessoryImage))}" alt=""></label>
                                        </div>
                                        <div class="form-text">
                                            <h4>${a.accessoryName}</h4>
                                            <div class="form-doc" style="box-sizing: border-box;">
                                                ${a.accessoryDescription}
                                            </div>
                                        </div>
                                        <div class="form-check">
                                            <div class="checkbox-container">
<!--                                                <input type="checkbox" id="daily-checkbox-${a.accessoryId}" class="option-checkbox">-->
                                                <select class="form-check-select" id="daily-select-${a.accessoryId}"
                                                    data-rawprice="${a.price}">
                                                </select>
                                                <c:if test="${a.price eq 0}">
                                                    <label for="daily-checkbox" class="items-free">Free</label>
                                                </c:if>
                                                <c:if test="${a.price ne 0}">
                                                    <fmt:formatNumber var="fmtAcc" value="${a.price}" maxFractionDigits="0" groupingUsed="true"/>
                                                    <label for="daily-checkbox" data-rawprice="${a.price}">₫${fmtAcc}</label>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>                               
                                </div><!-- end scrollable-vertical protection -->
                            </div><!-- end fieldset-content -->
                        </fieldset>

                        <h3>Khách hàng</h3>
                        <fieldset>
                            <h2>THÔNG TIN CÁ NHÂN</h2>
                            <p class="desc">Hãy xác nhận hoặc cập nhật thông tin của bạn</p>
                            <div class="fieldset-content">
                                <c:if test="${not empty sessionScope.account}">
                                    <a id="accountId"  style="display: none">${account.accountId}</a>
                                   
                                    <div class="form-row">
                                        <div class="form-flex">
                                            <div class="form-group">
                                                <label class="form-label">Họ <span class="note-star"> *</span></label>
                                                <input type="text" name="first_name" id="first_name" value="${account.firstName}" oninput="validateForm()" />
                                              
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Tên <span class="note-star"> *</span></label>
                                                <input type="text" name="last_name" id="last_name" value="${account.lastName}" oninput="validateForm()" />
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-flex">
                                            <div class="form-group">
                                                <label for="email" class="form-label">Email <span class="note-star"> *</span></label>
                                                <input type="email" name="email" id="email" value="${account.email}" oninput="validateForm()" />
<!--                                                <span class="text-input">Example :<span> Jeff@gmail.com</span></span>-->
                                            </div>
                                            <div class="form-group">
                                                <label for="phonenumber" class="form-label">Số điện thoại <span class="note-star"> *</span></label>
                                                <input type="text" name="phonenumber" id="phonenumber" value="${account.phoneNumber}" oninput="validateForm()"/>
<!--                                                <span class="text-input">+84</span>-->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group" style="width: 100%;">
                                            <label for="address" class="form-label">Địa chỉ <span class="note-star"> *</span></label>
                                            <input type="text" name="address" id="address" value="${account.address}" oninput="validateForm()" />
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-flex">
                                            <div class="form-group">
                                                 <label for="birth_date" class="form-label">Ngày sinh <span class="note-star"> *</span></label>
                                                 <input type="date" name="dob" id="dob" value="${account.dob}" oninput="validateForm()" />
                                            </div>
                                            <div class="form-group">
                                                <label for="gender" class="form-label">Giới tính <span class="note-star"> *</span></label>
                                                <div class="form-radio-group">   
                                                    <label><input type="radio" name="gender" value="Không muốn tiết lộ" ${account.gender == 'Không muốn tiết lộ' ? 'checked' : ''} onclick="validateForm()">Bí mật</label>
                                                    <label><input type="radio" name="gender" value="Nam" ${account.gender == 'Nam' ? 'checked' : ''} onclick="validateForm()">Nam</label>
                                                    <label><input type="radio" name="gender" value="Nữ" ${account.gender == 'Nữ' ? 'checked' : ''} onclick="validateForm()">Nữ</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:set var="flag" value="false" />                   
                                    <c:forEach items="${listC}" var="c">
                                        <c:if test="${account.accountId eq c.accountId}">
                                            <p style="display: none" id="customerId">${c.customerId}</p>
                                            <c:set var="flag" value="true" />
                                            <div class="form-enter">
                                                <div class="form-row">
                                                    <div class="form-flex">
                                                        <div class="form-group" style="width: 40%;">
                                                            <label for="drivernumber" class="form-label">CCCD/CMND <span class="note-star"> *</span></label>
                                                            <input type="text" name="drivernumber" id="identityCard" value="${c.identityCard}" onblur="validateForm()"/>
                                                        </div>
                                                        <div style="width: 60%; display: flex; gap: 20px;">
                                                            <div class="form-group" style="width: 50%">
                                                                <label for="issuedon" class="form-label">Ngày cấp <span class="note-star"> *</span></label>
                                                                <input type="date" name="issuedon" id="issuedon" value="${c.issuedOnDate}" oninput="validateForm()"/>
                                                            </div>
                                                            <div class="form-group" style="width: 50%">
                                                                <label for="expdate" class="form-label">Ngày hết hạn <span class="note-star"> *</span></label>
                                                                <input type="date" name="expdate" id="expdate" value="${c.expDate}" oninput="validateForm()"/>
                                                            </div>
                                                        </div>
                                                    </div> <!-- End form-flex for text inputs -->
                                                    
                                                    <div class="form-row" style="margin-top: 25px;">
                                                        <label class="form-label" style="display: block; margin-bottom: 15px; font-weight: 600;">Hình ảnh CCCD/CMND</label>
                                                        <div class="form-flex" style="align-items: flex-start;">
                                                            <c:set var="imagesArr" value="${fn:split(c.identityCardImage, ',')}" />
                                                            
                                                            <div class="upload-card-wrapper" style="flex: 1; min-width: 0;">
                                                                <label for="imageFront" class="upload-card">
                                                                    <i class="bi bi-person-vcard"></i>
                                                                    <span class="upload-title">Cập nhật mặt trước</span>
                                                                    <span class="upload-subtitle">Nhấn để chọn ảnh mới</span>
                                                                </label>
                                                                <input type="file" name="imageFront" id="imageFront" style="display: none;" />
                                                                
                                                                <!-- Preview Container (managed by JS) -->
                                                                <div class="image-preview-container" style="display: none;">
                                                                    <span class="existing-image-label">Ảnh mặt trước đã chọn:</span>
                                                                    <img class="img-preview" src="" />
                                                                </div>

                                                                <!-- Existing Image (shows when no new file is chosen) -->
                                                                <c:if test="${not empty imagesArr[0]}">
                                                                    <c:set var="frontUrl" value="${imagesArr[0]}" />
                                                                    <c:if test="${not fn:startsWith(frontUrl, 'http')}"><c:set var="frontUrl" value="upload/${frontUrl}" /></c:if>
                                                                    <div class="image-preview-container existing-image">
                                                                        <span class="existing-image-label">Mặt trước hiện tại:</span>
                                                                        <img src="${frontUrl}" class="img-preview" onerror="this.parentElement.style.display='none';"/>
                                                                    </div>
                                                                </c:if>
                                                            </div>

                                                            <div class="upload-card-wrapper" style="flex: 1; min-width: 0;">
                                                                <label for="imageBack" class="upload-card">
                                                                    <i class="bi bi-credit-card-2-back"></i>
                                                                    <span class="upload-title">Cập nhật mặt sau</span>
                                                                    <span class="upload-subtitle">Nhấn để chọn ảnh mới</span>
                                                                </label>
                                                                <input type="file" name="imageBack" id="imageBack" style="display: none;" />
                                                                
                                                                <!-- Preview Container (managed by JS) -->
                                                                <div class="image-preview-container" style="display: none;">
                                                                    <span class="existing-image-label">Ảnh mặt sau đã chọn:</span>
                                                                    <img class="img-preview" src="" />
                                                                </div>

                                                                <!-- Existing Image (shows when no new file is chosen) -->
                                                                <c:if test="${fn:length(imagesArr) gt 1 and not empty imagesArr[1]}">
                                                                    <c:set var="backUrl" value="${imagesArr[1]}" />
                                                                    <c:if test="${not fn:startsWith(backUrl, 'http')}"><c:set var="backUrl" value="upload/${backUrl}" /></c:if>
                                                                    <div class="image-preview-container existing-image">
                                                                        <span class="existing-image-label">Mặt sau hiện tại:</span>
                                                                        <img src="${backUrl}" class="img-preview" onerror="this.parentElement.style.display='none';"/>
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                </div>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${flag eq false}">
                                        <p style="display: none" id="customerId">Not</p>
                                        <div style="margin-top: 10px; color: red">
                                            <a>*Hãy cung cấp thông tin CCCD/CMND của bạn để tiếp tục</a>
                                        </div>
                                        
                                        <div class="form-enter">
                                            
                                            <div class="form-row">
                                                <div class="form-flex">
                                                    <div class="form-group" style="width: 40%;">
                                                        <label for="drivernumber" class="form-label">CCCD/CMND <span class="note-star"> *</span></label>
                                                        <input type="text" name="drivernumber" id="identityCard" oninput = "validateForm()"/>
                                                    </div>
                                                    <div style="width: 60%; display: flex; gap: 20px;">
                                                        <div class="form-group" style="width: 50%">
                                                            <label for="issuedon" class="form-label">Ngày cấp <span class="note-star"> *</span></label>
                                                            <input type="date" name="issuedon" id="issuedon" oninput="validateForm()"/>
                                                        </div>
                                                        <div class="form-group" style="width: 50%">
                                                            <label for="expdate" class="form-label">Ngày hết hạn <span class="note-star"> *</span></label>
                                                            <input type="date" name="expdate" id="expdate" oninput="validateForm()"/>
                                                        </div>
                                                    </div>
                                                </div> <!-- End form-flex for text inputs -->
                                                
                                                <div class="form-row" style="margin-top: 25px;">
                                                    <label class="form-label" style="display: block; margin-bottom: 15px; font-weight: 600;">Hình ảnh CCCD/CMND <span class="note-star"> *</span></label>
                                                    <div class="form-flex" style="align-items: flex-start;">
                                                        <div class="upload-card-wrapper" style="flex: 1; min-width: 0;">
                                                            <label for="imageFront" class="upload-card">
                                                                <i class="bi bi-person-vcard"></i>
                                                                <span class="upload-title">Tải lên mặt trước</span>
                                                                <span class="upload-subtitle">Nhấn để chọn ảnh</span>
                                                            </label>
                                                            <input type="file" name="imageFront" id="imageFront" style="display: none;" />
                                                            
                                                            <!-- Preview Container (managed by JS) -->
                                                            <div class="image-preview-container" style="display: none;">
                                                                <span class="existing-image-label">Ảnh mặt trước đã chọn:</span>
                                                                <img class="img-preview" src="" />
                                                            </div>
                                                        </div>

                                                        <div class="upload-card-wrapper" style="flex: 1; min-width: 0;">
                                                            <label for="imageBack" class="upload-card">
                                                                <i class="bi bi-credit-card-2-back"></i>
                                                                <span class="upload-title">Tải lên mặt sau</span>
                                                                <span class="upload-subtitle">Nhấn để chọn ảnh</span>
                                                            </label>
                                                            <input type="file" name="imageBack" id="imageBack" style="display: none;" />
                                                            
                                                            <!-- Preview Container (managed by JS) -->
                                                            <div class="image-preview-container" style="display: none;">
                                                                <span class="existing-image-label">Ảnh mặt sau đã chọn:</span>
                                                                <img class="img-preview" src="" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>                                 
                                </c:if>
                            </div>
                        </fieldset>

                        <h3>Xác nhận</h3>
                        <fieldset>
                            <h2>XÁC NHẬN ĐƠN ĐẶT XE</h2>
                            <p class="desc">Hãy kiểm tra kỹ thông tin đơn đặt xe của bạn trước khi thanh toán.</p>
                            <div class="fieldset-content">
                                <div class="scrollable-vertical">

                                    <!-- THỜI GIAN -->
                                    <div style="background:#fff; border:1px solid #eaeaea; border-radius:12px; padding:20px; margin-bottom:16px;">
                                        <h4 style="margin:0 0 14px; color:#b59349; font-size:13px; text-transform:uppercase; letter-spacing:1px; border-bottom:1px solid #f0f0f0; padding-bottom:10px;">
                                            <i class="bi bi-clock-history"></i> Thời Gian Thuê
                                        </h4>
                                        <div style="display:grid; grid-template-columns:1fr 1fr; gap:16px;">
                                            <div>
                                                <div style="font-size:11px; color:#999; text-transform:uppercase; font-weight:700; margin-bottom:4px;">Nhận xe</div>
                                                <div style="font-weight:600; color:#222; font-size:15px;"><span id="pickupdatetext"></span> <span id="pickuptimetext"></span></div>
                                                <div id="pickuploctext" style="font-size:13px; color:#666; margin-top:3px;"></div>
                                            </div>
                                            <div>
                                                <div style="font-size:11px; color:#999; text-transform:uppercase; font-weight:700; margin-bottom:4px;">Trả xe</div>
                                                <div style="font-weight:600; color:#222; font-size:15px;"><span id="returndatetext"></span> <span id="returntimetext"></span></div>
                                                <div id="returnloctext" style="font-size:13px; color:#666; margin-top:3px;"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- THÔNG TIN KHÁCH HÀNG -->
                                    <div style="background:#fff; border:1px solid #eaeaea; border-radius:12px; padding:20px; margin-bottom:16px;">
                                        <h4 style="margin:0 0 14px; color:#b59349; font-size:13px; text-transform:uppercase; letter-spacing:1px; border-bottom:1px solid #f0f0f0; padding-bottom:10px;">
                                            <i class="bi bi-person-lines-fill"></i> Thông Tin Khách Hàng
                                        </h4>
                                        <div style="display:grid; grid-template-columns:1fr 1fr; gap:12px;">
                                            <div>
                                                <div style="font-size:11px; color:#999; margin-bottom:3px;">Họ</div>
                                                <div style="font-weight:600;" id="firstnametext"></div>
                                            </div>
                                            <div>
                                                <div style="font-size:11px; color:#999; margin-bottom:3px;">Tên</div>
                                                <div style="font-weight:600;" id="lastnametext"></div>
                                            </div>
                                            <div>
                                                <div style="font-size:11px; color:#999; margin-bottom:3px;">Số điện thoại</div>
                                                <div style="font-weight:600;" id="phonetext"></div>
                                            </div>
                                            <div>
                                                <div style="font-size:11px; color:#999; margin-bottom:3px;">Email</div>
                                                <div style="font-weight:600;" id="emailaddresstext"></div>
                                            </div>
                                            <div>
                                                <div style="font-size:11px; color:#999; margin-bottom:3px;">Địa chỉ</div>
                                                <div style="font-weight:600;" id="addresstext"></div>
                                            </div>
                                            <div>
                                                <div style="font-size:11px; color:#999; margin-bottom:3px;">Ngày sinh</div>
                                                <div style="font-weight:600;" id="birthdaytext"></div>
                                            </div>
                                            <div>
                                                <div style="font-size:11px; color:#999; margin-bottom:3px;">Giới tính</div>
                                                <div style="font-weight:600;" id="gendertext"></div>
                                            </div>
                                            <div>
                                                <div style="font-size:11px; color:#999; margin-bottom:3px;">CCCD/CMND</div>
                                                <div style="font-weight:600;" id="identityCardtext"></div>
                                            </div>
                                            <div>
                                                <div style="font-size:11px; color:#999; margin-bottom:3px;">Ngày cấp</div>
                                                <div style="font-weight:600;" id="issuedontext"></div>
                                            </div>
                                            <div>
                                                <div style="font-size:11px; color:#999; margin-bottom:3px;">Ngày hết hạn</div>
                                                <div style="font-weight:600;" id="expdatetext"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- DỊCH VỤ ĐÃ CHỌN (xe + phụ kiện + tổng) -->
                                    <div style="background:#faf9f7; border:1px solid #e0d5b7; border-radius:12px; padding:20px; margin-bottom:16px;">
                                        <h4 style="margin:0 0 14px; color:#b59349; font-size:13px; text-transform:uppercase; letter-spacing:1px; border-bottom:1px solid #e0d5b7; padding-bottom:10px;">
                                            <i class="bi bi-receipt"></i> Chi Tiết Dịch Vụ & Tổng Tiền
                                        </h4>
                                        <div id="savedBikeContainer" style="margin-bottom:12px; min-height:20px;"></div>
                                        <div id="savedItemsContainer" style="margin-bottom:12px; min-height:20px;"></div>
                                        <div id="form-box-total"></div>
                                    </div>

                                    <!-- VOUCHER -->
                                    <div style="background:#fff; border:1px solid #eaeaea; border-radius:12px; padding:20px; margin-bottom:16px;">
                                        <h4 style="margin:0 0 14px; color:#b59349; font-size:13px; text-transform:uppercase; letter-spacing:1px; border-bottom:1px solid #f0f0f0; padding-bottom:10px;">
                                            <i class="bi bi-ticket-perforated"></i> Mã Giảm Giá (Voucher)
                                        </h4>
                                        <div style="display:flex; gap:10px; align-items:center;">
                                            <input type="text" id="voucher-code-input" placeholder="Nhập mã voucher..." style="flex:1; padding:10px 14px; border:1.5px solid #ddd; border-radius:8px; font-size:14px; outline:none;" />
                                            <button type="button" id="apply-voucher-btn" onclick="applyVoucher()" style="background:#b59349; color:#fff; border:none; padding:10px 20px; border-radius:8px; font-weight:700; cursor:pointer; font-size:14px; white-space:nowrap;">Áp dụng</button>
                                        </div>
                                        <div id="voucher-msg" style="font-size:13px; margin-top:8px;"></div>
                                        <input type="hidden" id="applied-discount" value="0"/>
                                        <input type="hidden" id="applied-voucher-id" value="0"/>
                                    </div>

                                    <!-- ĐIỀU KHOẢN -->
                                    <div style="background:#fffbf2; border:1px solid #f0e4b8; border-radius:12px; padding:20px;">
                                        <h4 style="margin:0 0 12px; color:#b59349; font-size:13px; text-transform:uppercase; letter-spacing:1px;">
                                            <i class="bi bi-shield-check"></i> Điều Khoản &amp; Chính Sách
                                        </h4>
                                        <ul style="font-size:13px; color:#555; margin:0 0 14px; padding-left:18px; line-height:2;">
                                            <li>Người thuê phải có <strong>bằng lái xe hợp lệ</strong> và đủ <strong>18 tuổi</strong> trở lên.</li>
                                            <li>Xuất trình <strong>CCCD/Hộ chiếu</strong> khi nhận xe.</li>
                                            <li>Xe được giao đúng địa điểm và thời gian đã chọn. Trả muộn tính phí thêm.</li>
                                            <li>Tiền cọc hoàn trả khi trả xe đúng hạn và nguyên vẹn.</li>
                                            <li>Hủy miễn phí <strong>trước 24 giờ</strong> nhận xe. Hoàn tiền trong 7 ngày làm việc.</li>
                                        </ul>
                                        <div style="margin-bottom:14px;">
                                            <button type="button" onclick="document.getElementById('terms-modal').style.display='flex'"
                                                style="background:none; border:none; padding:0; color:#b59349; font-size:13px; font-weight:600; cursor:pointer; text-decoration:underline;">
                                                📄 Xem đầy đủ Chính sách &amp; Điều khoản →
                                            </button>
                                        </div>
                                        <label style="display:flex; align-items:center; gap:10px; cursor:pointer; font-size:14px; font-weight:600; color:#333;">
                                            <input type="checkbox" id="daily-checkbox-term" style="width:18px; height:18px; accent-color:#b59349; cursor:pointer;" />
                                            Tôi đã đọc và đồng ý với <span style="color:#b59349; text-decoration:underline; cursor:pointer;" onclick="document.getElementById('terms-modal').style.display='flex'">Điều khoản &amp; Chính sách</span> của SmartRide
                                        </label>
                                    </div>

                                </div>
                            </div>
                        </fieldset>

                        <!-- MODAL ĐIỀU KHOẢN SMARTRIDE -->
                        <div id="terms-modal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.55); z-index:99999; align-items:center; justify-content:center; padding:20px; box-sizing:border-box;">
                            <div style="background:#fff; border-radius:16px; max-width:720px; width:100%; max-height:85vh; overflow:hidden; display:flex; flex-direction:column; box-shadow:0 24px 60px rgba(0,0,0,0.25);">
                                <div style="padding:20px 24px; border-bottom:1px solid #f0e4b8; display:flex; align-items:center; justify-content:space-between; background:#fffbf2;">
                                    <div>
                                        <h3 style="margin:0; color:#b59349; font-size:18px;">🛡️ Chính sách &amp; Điều khoản SmartRide</h3>
                                        <p style="margin:4px 0 0; font-size:12px; color:#888;">Vui lòng đọc kỹ trước khi xác nhận đặt xe</p>
                                    </div>
                                    <button type="button" onclick="document.getElementById('terms-modal').style.display='none'"
                                        style="background:#f3f4f6; border:none; width:34px; height:34px; border-radius:50%; font-size:18px; cursor:pointer; color:#555;">✕</button>
                                </div>
                                <div style="overflow-y:auto; padding:24px; flex:1; font-size:14px; color:#444; line-height:1.8;">
                                    <h4 style="color:#b59349; margin:0 0 6px;">1. Giới thiệu</h4>
                                    <p>Chào mừng bạn đến với <strong>SmartRide</strong>! Chúng tôi cung cấp dịch vụ cho thuê xe máy nhằm giúp bạn dễ dàng di chuyển và khám phá. Vui lòng đọc kỹ các điều khoản dưới đây.</p>
                                    <hr style="border:none; border-top:1px solid #f0e4b8; margin:14px 0;">
                                    <h4 style="color:#b59349; margin:0 0 6px;">2. Đăng ký và Tài khoản</h4>
                                    <p><strong>Đăng ký Tài khoản:</strong> Người dùng phải đăng ký tài khoản hợp lệ để sử dụng dịch vụ.<br>
                                    <strong>Bảo mật Tài khoản:</strong> Người dùng tự chịu trách nhiệm bảo mật thông tin tài khoản.</p>
                                    <hr style="border:none; border-top:1px solid #f0e4b8; margin:14px 0;">
                                    <h4 style="color:#b59349; margin:0 0 6px;">3. Điều khoản Thuê xe</h4>
                                    <p><strong>Điều kiện:</strong> Có bằng lái hợp lệ, đủ 18 tuổi trở lên. Xuất trình CCCD/Hộ chiếu khi nhận xe.<br>
                                    <strong>Đặt xe:</strong> Sau khi đặt, khách nhận xác nhận qua email với thông tin chi tiết.<br>
                                    <strong>Thanh toán:</strong> Hoàn thành thanh toán trước khi nhận xe. Chấp nhận VNPay, thẻ tín dụng/ghi nợ.</p>
                                    <hr style="border:none; border-top:1px solid #f0e4b8; margin:14px 0;">
                                    <h4 style="color:#b59349; margin:0 0 6px;">4. Sử dụng Xe</h4>
                                    <p><strong>An toàn:</strong> Tuân thủ luật giao thông, đội mũ bảo hiểm khi lái xe.<br>
                                    <strong>Bảo quản:</strong> Chịu trách nhiệm xe suốt thời gian thuê. Hư hại phải báo cáo ngay.<br>
                                    <strong>Trả xe:</strong> Đúng giờ, đúng địa điểm. <strong>Trả muộn bị tính phí thêm.</strong></p>
                                    <hr style="border:none; border-top:1px solid #f0e4b8; margin:14px 0;">
                                    <h4 style="color:#b59349; margin:0 0 6px;">5. Bảo hiểm &amp; Trách nhiệm</h4>
                                    <p><strong>Bảo hiểm:</strong> SmartRide cung cấp bảo hiểm cơ bản cho xe thuê.<br>
                                    <strong>Trách nhiệm:</strong> Người thuê chịu trách nhiệm pháp lý với mọi hành động khi sử dụng xe.</p>
                                    <hr style="border:none; border-top:1px solid #f0e4b8; margin:14px 0;">
                                    <h4 style="color:#b59349; margin:0 0 6px;">6. Hủy Bỏ &amp; Hoàn Tiền</h4>
                                    <p><strong>Hủy miễn phí:</strong> Trước 24 giờ so với thời gian nhận xe.<br>
                                    <strong>Hoàn tiền:</strong> Xử lý trong vòng <strong>7 ngày làm việc</strong> sau khi xác nhận hủy.</p>
                                    <hr style="border:none; border-top:1px solid #f0e4b8; margin:14px 0;">
                                    <h4 style="color:#b59349; margin:0 0 6px;">7. Quyền riêng tư</h4>
                                    <p>SmartRide cam kết bảo vệ thông tin cá nhân và không chia sẻ cho bên thứ ba ngoài mục đích dịch vụ.</p>
                                    <hr style="border:none; border-top:1px solid #f0e4b8; margin:14px 0;">
                                    <h4 style="color:#b59349; margin:0 0 6px;">8. Liên hệ</h4>
                                    <p>Mọi thắc mắc về điều khoản, vui lòng liên hệ qua email hoặc số điện thoại trên website. Chi tiết đầy đủ tại <a href="policies.jsp" target="_blank" style="color:#b59349; font-weight:600;">trang Chính sách</a>.</p>
                                </div>
                                <div style="padding:14px 24px; border-top:1px solid #f0e4b8; display:flex; justify-content:flex-end; gap:10px; background:#fafafa;">
                                    <button type="button" onclick="document.getElementById('terms-modal').style.display='none'"
                                        style="padding:10px 20px; background:#f3f4f6; border:none; border-radius:8px; font-size:14px; cursor:pointer; color:#555; font-weight:600;">Đóng</button>
                                    <button type="button" onclick="document.getElementById('daily-checkbox-term').checked=true; document.getElementById('terms-modal').style.display='none'; if(typeof toggleNextButton==='function') toggleNextButton();"
                                        style="padding:10px 24px; background:#b59349; color:#fff; border:none; border-radius:8px; font-size:14px; font-weight:700; cursor:pointer;">✓ Đã đọc &amp; Đồng ý</button>
                                </div>
                            </div>
                        </div>

                        
                        <h3>Thanh toán</h3>
                        <fieldset>
<!--                            <a onclick="yourFunctionName()">aaaaa</a>-->
                            <h2>THANH TOÁN CỌC</h2>
                            <p class="desc">Hãy thanh toán số tiền cọc theo bên dưới để hoàn thành đơn đặt xe của bạn</p>
                            <iframe id="myIframe" src="vnpay_pay.jsp" style="width: 100%; height: 550px; border-style: hidden"></iframe>
                            
                        </fieldset>
                    </div>
                </form>
            </div>

        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="vendor/jquery-validation/dist/additional-methods.min.js"></script>
        <script src="vendor/jquery-steps/jquery.steps.min.js"></script>
        <script src="vendor/minimalist-picker/dobpicker.js"></script>
        <script src="vendor/nouislider/nouislider.min.js"></script>
        <script src="vendor/wnumb/wNumb.js"></script>
        <script>
            // Unused navbar fetch commented out to prevent console error
            /*
            fetch('includes/navbar2.jsp')  // Sử dụng đường dẫn tương đối
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(html => {
                const container = document.getElementById('navbar-container');
                const shadowRoot = container.attachShadow({ mode: 'open' });

                // Thêm liên kết tới thư viện Bootstrap Icons
                const link = document.createElement('link');
                link.rel = 'stylesheet';
                link.href = 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css';
                shadowRoot.appendChild(link);

                const template = document.createElement('template');
                template.innerHTML = html;

                // Copy các thẻ link và script từ template vào shadow DOM
                const linksAndScripts = template.content.querySelectorAll('link, script');
                linksAndScripts.forEach(element => {
                    shadowRoot.appendChild(element.cloneNode(true));
                });

                // Copy nội dung chính vào shadow DOM
                shadowRoot.appendChild(template.content.cloneNode(true));
            })
            .catch(error => {
                console.error('Fetch error:', error);
            });
            */
            
            let totalI = 0;
            const numberAccessStatesI = {};
            (function ($) {



                var form = $("#signup-form");
                
                // minAdvanceTime validation removed per user request

                $.validator.addMethod("businessHours", function(value, element) {
                    if (!value) return true;
                    var parts = value.split(':');
                    if (parts.length < 2) return true;
                    var hour = parseInt(parts[0], 10);
                    var minute = parseInt(parts[1], 10);
                    if (hour < 7 || hour > 23 || (hour === 23 && minute > 0)) {
                        return false;
                    }
                    return true;
                }, "Chỉ nhận/trả xe trong giờ hoạt động (07:00 - 23:00)");

                form.validate({
                    errorPlacement: function errorPlacement(error, element) {
                        element.before(error);
                    },
                    rules: {
                        email: {
                            email: true
                        },
                        pickuptime: {
                            businessHours: true
                        },
                        returntime: {
                            businessHours: true
                        }
                    },
                    onfocusout: function (element) {
                        $(element).valid();
                    },
                });
                form.children("div").steps({
                    headerTag: "h3",
                    bodyTag: "fieldset",
                    transitionEffect: "fade",
                    stepsOrientation: "vertical",
                    titleTemplate: '<div class="title"><span class="step-number">#index#</span><span class="step-text">#title#</span></div>',
                    labels: {
                        previous: 'Lùi lại',
                        next: 'Tiếp theo',
                        finish: 'Kết thúc',
                        current: '',
                    },
                    onStepChanging: function (event, currentIndex, newIndex) {
                        if (currentIndex === 0) {
                            form.parent().parent().parent().append('<div class="footer footer-' + currentIndex + '"></div>');
                        }
                        if (currentIndex === 1) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-0').addClass('footer-' + currentIndex + '');
                        }
                        if (currentIndex === 2) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-1').addClass('footer-' + currentIndex + '');
                        }
                        if (currentIndex === 3) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-2').addClass('footer-' + currentIndex + '');
                        }
                        if (currentIndex === 4) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-3').addClass('footer-' + currentIndex + '');
                        }
                        if (currentIndex === 5) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-4').addClass('footer-' + currentIndex + '');
                        }

                        // if(currentIndex === 4) {
                        //     form.parent().parent().parent().append('<div class="footer" style="height:752px;"></div>');
                        // }
                        form.validate().settings.ignore = ":disabled,:hidden";

                        // ===== VALIDATE: Không cho đặt xe trong quá khứ =====
                        if (currentIndex === 0 && newIndex > 0) {
                            var pickupDateVal = document.getElementById('pickupdate').value;
                            var pickupTimeVal = document.getElementById('pickuptime').value || '00:00';
                            if (pickupDateVal) {
                                var pickupDateTime = new Date(pickupDateVal + 'T' + pickupTimeVal + ':00');
                                var now = new Date();
                                if (pickupDateTime <= now) {
                                    // Hiển thị lỗi dưới ô ngày nhận xe
                                    var errEl = document.getElementById('pickup-past-error');
                                    if (!errEl) {
                                        errEl = document.createElement('div');
                                        errEl.id = 'pickup-past-error';
                                        errEl.style.cssText = 'color:#dc2626; font-size:13px; margin-top:6px; font-weight:600;';
                                        document.getElementById('pickupdate').parentNode.appendChild(errEl);
                                    }
                                    errEl.textContent = '⚠️ Ngày & giờ nhận xe phải ở tương lai, không thể đặt xe trong quá khứ!';
                                    document.getElementById('pickupdate').style.borderColor = '#dc2626';
                                    return false;
                                } else {
                                    var errEl2 = document.getElementById('pickup-past-error');
                                    if (errEl2) errEl2.remove();
                                    document.getElementById('pickupdate').style.borderColor = '';
                                }
                            }
                        }

                        return form.valid();
                    },
                    onFinishing: function (event, currentIndex) {
                        form.validate().settings.ignore = ":disabled";
                        return form.valid();
                    },
                    onFinished: function (event, currentIndex) {
                        
                        var formData = form.serialize();
                      
                        $.ajax({
                        url: 'forgotPassword', // Replace with your servlet URL
                        type: 'POST',
                        data: formData,
                       
                        success: function (response) {
                            // Handle success
                            alert('Submitted successfully');
                            console.log(response);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            // Handle error
                            alert('Submission failed');
                            console.error(textStatus, errorThrown);
                        }
                    });
                    },
                    onStepChanged: function (event, currentIndex, priorIndex) {

                        var nextButton = document.querySelector('.wizard .actions a[href="#next"]');
                        storedFormData = {
                                pickupdate: document.getElementById('pickupdate').value,
                                pickuptime: document.getElementById('pickuptime').value,
                                returndate: document.getElementById('returndate').value,
                                returntime: document.getElementById('returntime').value,
                                pickuplocation: document.getElementById('pickuplocation').value,
                                returnlocation: document.getElementById('returnlocation').value
                            };
                        const pickupDateText = storedFormData.pickupdate;
                        const returnDateText = storedFormData.returndate;

                        // Chuyển các chuỗi ngày thành đối tượng Date
                        const pickupDate = new Date(pickupDateText);
                        const returnDate = new Date(returnDateText);

                        // Tính số ngày chênh lệch
                        const differenceInTime = returnDate.getTime() - pickupDate.getTime();
                        const differenceInDays = differenceInTime / (1000 * 3600 * 24);
                            
                        if(currentIndex === 0){
                            nextButton.style.pointerEvents = 'auto';
                            nextButton.style.color = '';
                            nextButton.style.background = ''; nextButton.style.opacity = '1';
                        }
                        if (currentIndex === 1) {
//                            nextButton.style.pointerEvents = 'none';
//                            nextButton.style.background = ''; nextButton.style.opacity = '0.5';
//                            nextButton.style.color = '';
                            
                            toggleBikeNextButton();
                            changePrice();
                           
                       }
                       if(currentIndex === 5){
                           var finishButton = document.querySelector('.wizard .actions a[href="#finish"]');
                           finishButton.style.display = 'none';
                            // Lấy thẻ h2
                            const dataH2 = document.getElementById('dataInput');

                            // Lấy iframe
                            const iframe = document.getElementById('myIframe');

                            // Truyền dữ liệu từ thẻ h2 vào iframe khi thẻ h2 thay đổi
                            const sendDataToIframe = () => {
                                // Lấy giá trị của thẻ h2
                                const dataTotal = dataH2.textContent.replace(/[₫,.]/g, '').trim(); // Lấy dữ liệu và xóa dấu chấm và dấu chấm câu
                                console.log(dataTotal);
                                const data = {
                                    dataTotal: dataTotal
                                };
                                // Truyền giá trị vào iframe
                                iframe.contentWindow.postMessage(data, '*');
                            };

                            // Gọi hàm để gửi dữ liệu ngay khi tải trang
                            sendDataToIframe();

                            // Theo dõi sự thay đổi của thẻ h2 và gửi dữ liệu vào iframe
                            const observer = new MutationObserver(sendDataToIframe);

                            observer.observe(dataH2, { childList: true, subtree: true });
                       }
                       
                       function changePrice(){
                            var quantityDay = Math.max(1, Math.ceil(differenceInDays));
                            const priceDayElements = document.querySelectorAll('.price-day');
                            const priceWeekElements = document.querySelectorAll('.price-week');
                            const priceMonthElements = document.querySelectorAll('.price-month');
                            
                            priceDayElements.forEach(element => {
                                   element.style.display = "none";
                                   element.classList.remove("price-current");
                            });
                            priceWeekElements.forEach(element => {
                                element.style.display = "none";
                                element.classList.remove("price-current");
                            });
                            priceMonthElements.forEach(element => {
                               element.style.display = "none";
                               element.classList.remove("price-current");
                            });
                            
                            console.log(differenceInDays);
                            
                            if(quantityDay >= 1 && quantityDay <= 7){
                                
                                priceDayElements.forEach(element => {
                                   element.style.display = "inline-block";
                                   element.classList.add("price-current");
                                });
                            }
                            else if(quantityDay >= 8 && quantityDay <= 30){
                                
                                priceWeekElements.forEach(element => {
                                   element.style.display = "inline-block";
                                   element.classList.add("price-current");
                                });
                            }
                            else if(quantityDay >= 30){
                                
                                priceMonthElements.forEach(element => {
                                   element.style.display = "inline-block";
                                   element.classList.add("price-current");
                                });
                            }
                       }

                        if (currentIndex === 3) {
                            validateForm();
//                            nextButton.style.pointerEvents = 'auto';
//                            nextButton.style.color = '';
//                            nextButton.style.background = ''; nextButton.style.opacity = '1';
                        }
                        
                        if (currentIndex === 2) {
                            nextButton.style.pointerEvents = 'auto';
                            nextButton.style.color = '';
                            nextButton.style.background = ''; nextButton.style.opacity = '1';
                            let sum = 0;
                            const checkboxMotorContainer = document.getElementById('motorcyclelist');
                            const selectBoxes = checkboxMotorContainer.querySelectorAll('.form-check-select');

                            // Lặp qua từng select box và lấy thông tin nếu giá trị lớn hơn 0
                            selectBoxes.forEach(selectBox => {
                                const quantity = parseInt(selectBox.value);
                                if (quantity > 0) {
                                   sum += quantity;
                                }
                            });
                            
                            if(sum !== totalI){
                                totalI = sum;
                                const checkboxContainer = document.getElementById('protection');
                                // Đặt max và min cho các input có class 'form-check-select'
                                checkboxContainer.querySelectorAll('.form-check-select').forEach(input => {
                                    const label = input.nextElementSibling;
                                    let max = sum * 2;
                                    const min = 0;
                                    
                                    if (label.classList.contains('items-free')) {
                                        max = sum;
                                    }
                                    createOptions(input, min, max);
                                    
                                });
                                
                                if (numberAccessStatesI) {
                                    console.log(Object.keys(numberAccessStatesI).length !== 0);
                                    if(Object.keys(numberAccessStatesI).length !== 0){
                                        Object.keys(numberAccessStatesI).forEach(numberId => {
                                            const numberSelect = document.querySelector(`#protection #` + numberId);
                                            if (numberSelect) {
                                               
                                                const value = typeof numberAccessStatesI[numberId] === 'number' && !isNaN(numberAccessStatesI[numberId]) ? numberAccessStatesI[numberId] : 0;
                                                numberSelect.value = value;

                                            }
                                        });
                                    }
                                }                        
                                
                            }
                          
//                        
                            // Hàm tạo các tùy chọn cho thẻ <select>
                            function createOptions(selectElement, min, max) {
                                selectElement.innerHTML = ''; // Xóa các tùy chọn cũ nếu có
                                for (let i = min; i <= max; i++) {
                                    const option = document.createElement('option');
                                    option.value = i;
                                    option.text = i;
                                    selectElement.appendChild(option);
                                }
                            }
                            
                            
                        }
                        
                        if(currentIndex !== 5){
                            const steps = document.querySelectorAll('.wizard ul[role="tablist"] li');
                            steps[5].classList.remove('done');
                            steps[5].classList.add('disabled');
                        }
                        
                        if (currentIndex === 4) { // Bước thứ tư (index bắt đầu từ 0)
                            const checkbox = document.getElementById('daily-checkbox-term');
                            nextButton.style.pointerEvents = 'none';
                            nextButton.style.background = ''; nextButton.style.opacity = '0.5';
                            nextButton.style.color = '';
                            
                            // Function to toggle the next button based on the checkbox state
                            checkbox.addEventListener('change', toggleNextButton);
                            // Initial check
                            toggleNextButton();
                            changePrice();
                            // Lấy dữ liệu đã lưu từ localStorage và thêm lại vào savedItemsContainer
                            
                            if (storedFormData) {
                                document.getElementById('pickupdatetext').textContent = storedFormData.pickupdate;
                                document.getElementById('pickuploctext').textContent = storedFormData.pickuplocation;
                                document.getElementById('pickuptimetext').textContent = storedFormData.pickuptime;
                                document.getElementById('returnloctext').textContent = storedFormData.returnlocation;
                                document.getElementById('returndatetext').textContent = storedFormData.returndate;
                                document.getElementById('returntimetext').textContent = storedFormData.returntime;
                            }

                            //Add motorcycle have chosen
                            const savedBikeContainer = document.getElementById('savedBikeContainer');
                            savedBikeContainer.innerHTML = '';

                     
                            const numberMotorStates = {};


                            const checkboxMotorContainer = document.getElementById('motorcyclelist');

                            //tất cả các select box trong div
                            const selectBoxes = checkboxMotorContainer.querySelectorAll('.form-check-select');

                            // Lặp qua từng select box và lấy thông tin nếu giá trị lớn hơn 0
                            selectBoxes.forEach(selectBox => {
                                const quantity = parseInt(selectBox.value);
                                if (quantity > 0) {
                                    const formMotorBox = selectBox.closest('.form-box');
                                    if (formMotorBox) {
                                        // Clone và lưu thông tin giá vào data attribute để tính đúng sau
                                        const priceCurrentEl = formMotorBox.querySelector('.main-price.price-current') || formMotorBox.querySelector('.main-price');
                                        const rawPrice = priceCurrentEl ? (priceCurrentEl.dataset.rawprice || '') : '';
                                        const cloneBox = formMotorBox.cloneNode(true);
                                        cloneBox.dataset.activeprice = rawPrice;
                                        savedBikeContainer.insertAdjacentHTML('beforeend', cloneBox.outerHTML);
                                        numberMotorStates[selectBox.id] = quantity;
                                    }
                                }
                            });

                             // Hiển thị các giá trị đã lưu trong numberMotorStates
                            if (numberMotorStates) {
                                Object.keys(numberMotorStates).forEach(numberId => {
                                    const numberSelect = document.querySelector(`#savedBikeContainer #` + numberId);
                                    if (numberSelect) {
                                        numberSelect.value = numberMotorStates[numberId];
                                        numberSelect.disabled = true;  // Nếu bạn muốn vô hiệu hóa các select box đã được lưu
                                    }
                                });
                            }
                            
                            //Add assecc item have chosen
                            const savedItemsContainer = document.getElementById('savedItemsContainer');
                            savedItemsContainer.innerHTML = ''; // Clear any previous 

                            const numberAccessStates = {};


                            const checkboxContainer = document.getElementById('protection');

                            // Lấy tất cả các checkbox trong div
                            const checkboxes = checkboxContainer.querySelectorAll('.form-check-select');

                            // Lặp qua từng checkbox và lấy thông tin
                            checkboxes.forEach(selectBox => {
                                const quantity = parseInt(selectBox.value);
                                if (quantity > 0) {
                                    const formAccessBox = selectBox.closest('.form-box');
                                    if (formAccessBox) {
                                        savedItemsContainer.insertAdjacentHTML('beforeend', formAccessBox.outerHTML);
                                        numberAccessStates[selectBox.id] = quantity;
                                    }
                                }
                            });
                            if (numberAccessStates) {
                                Object.keys(numberAccessStates).forEach(numberId => {
                                    const numberSelect = document.querySelector(`#savedItemsContainer #` + numberId);
                                    if (numberSelect) {
                                        numberSelect.value = numberAccessStates[numberId];
                                        numberSelect.disabled = true;  // Nếu bạn muốn vô hiệu hóa các select box đã được lưu
                                    }
                                });
                            }
                            

                          
                            
                            formData = {
                                first_name: document.getElementById('first_name').value,
                                last_name: document.getElementById('last_name').value,
                                email: document.getElementById('email').value,
                                phonenumber: document.getElementById('phonenumber').value,
                                address: document.getElementById('address').value,                           
                                dob: document.getElementById('dob').value,                          
                                gender: document.querySelector('input[name="gender"]:checked') ? document.querySelector('input[name="gender"]:checked').value : '',
                                identityCard : document.getElementById("identityCard").value,
                                issuedon : document.getElementById("issuedon").value,
                                expdate : document.getElementById("expdate").value                              
                            };

                            if (formData) {
                                document.getElementById('firstnametext').textContent = formData.first_name;
                                document.getElementById('lastnametext').textContent = formData.last_name;
                                document.getElementById('emailaddresstext').textContent = formData.email;
                                document.getElementById('phonetext').textContent = formData.phonenumber;
                                document.getElementById('addresstext').textContent = formData.address;                         
                                document.getElementById('birthdaytext').textContent = formData.dob;    
                                document.getElementById('gendertext').textContent = formData.gender;
                                document.getElementById('identityCardtext').textContent = formData.identityCard;
                                document.getElementById('issuedontext').textContent = formData.issuedon;   
                                document.getElementById('expdatetext').textContent = formData.expdate;   
                            }
                            // Thêm tiêu đề h4 và dữ liệu số lượng với giá tiền vào div cụ thể trong item-container
                            buildStep5Table();
                        }

                        // Hàm toàn cục: có thể gọi lại bất kỳ lúc nào (VD: sau khi áp voucher)
                        window.buildStep5Table = function() {
                            const formBoxTotal = document.getElementById('form-box-total');
                            if (!formBoxTotal) return;
                            formBoxTotal.innerHTML = '';
                            let totalAmount = 0;
                            
                            let tableHtml = `
                                <div style="background: #fff; padding: 20px; border-radius: 12px; border: 1px solid #eee; box-shadow: 0 4px 12px rgba(0,0,0,0.03);">
                                    <table style="width: 100%; border-collapse: collapse; margin-bottom: 0;">
                                        <thead>
                                            <tr style="border-bottom: 2px solid #e0c87a; text-align: left; color: #b59349; font-size: 14px;">
                                                <th style="padding: 12px 10px; font-weight: bold;">Dịch vụ</th>
                                                <th style="padding: 12px 10px; text-align: center; font-weight: bold; width: 12%;">Thời gian</th>
                                                <th style="padding: 12px 10px; text-align: center; font-weight: bold; width: 12%;">Số lượng</th>
                                                <th style="padding: 12px 10px; text-align: right; font-weight: bold; width: 18%;">Đơn giá</th>
                                                <th style="padding: 12px 10px; text-align: right; font-weight: bold; width: 22%;">Thành tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                            `;
                            
                            //calculator motorcycles
                            const  savedBikeCal = document.querySelectorAll('#savedBikeContainer .form-box');
                            savedBikeCal.forEach(formBox => { 
                                 const selects = formBox.querySelector('.form-check-select');
                                 const title = formBox.querySelector('h4') ? formBox.querySelector('h4').textContent.trim() : '?';
                                 const quantity = parseInt(selects ? selects.value : 0, 10) || 0;

                                 // Quantity là số ngày chênh lệch giữa ngày trả và ngày pickup
                                 const quantityDay = Math.max(1, Math.ceil(differenceInDays)); // Đảm bảo quantity ít nhất là 1

                                 // Động chọn giá dựa trên số ngày thuê
                                 let price = 0;
                                 let priceLabelDesc = "Ngày";
                                 if (quantityDay >= 30) {
                                     const priceEl = formBox.querySelector('.price-month');
                                     if (priceEl) price = parseInt(priceEl.dataset.rawprice, 10) || 0;
                                     priceLabelDesc = "Tháng (Ưu đãi)";
                                 } else if (quantityDay >= 7) {
                                     const priceEl = formBox.querySelector('.price-week');
                                     if (priceEl) price = parseInt(priceEl.dataset.rawprice, 10) || 0;
                                     priceLabelDesc = "Tuần (Ưu đãi)";
                                 } else {
                                     const priceEl = formBox.querySelector('.price-day');
                                     if (priceEl) price = parseInt(priceEl.dataset.rawprice, 10) || 0;
                                     priceLabelDesc = "Ngày";
                                 }

                                 // Fallback nếu không tìm thấy thẻ giá
                                 if (price === 0) {
                                     const activePrice = formBox.dataset.activeprice;
                                     if (activePrice && activePrice !== '') price = parseInt(activePrice, 10) || 0;
                                 }

                                 // Tính tổng giá
                                 const totalPrice = quantityDay * price * quantity;
                                 totalAmount += totalPrice;

                                 tableHtml += `
                                    <tr style="border-bottom: 1px dashed #eee;">
                                        <td style="padding: 16px 10px;">
                                            <h4 style="margin: 0 0 6px 0; font-size: 15px; color: #333; font-weight: bold;">` + title + `</h4>
                                            <div style="font-size: 11px; color: #888; display: inline-block; padding: 2px 8px; border-radius: 4px; border: 1px solid #e0c87a; background: #fffdf5;">
                                                Gói áp dụng: <strong style="color: #b59349;">` + priceLabelDesc + `</strong>
                                            </div>
                                        </td>
                                        <td style="padding: 16px 10px; text-align: center; color: #555; font-size: 14px; font-weight: 500;">` + quantityDay + ` Ngày</td>
                                        <td style="padding: 16px 10px; text-align: center; color: #555; font-size: 14px; font-weight: 500;">` + quantity + ` Xe</td>
                                        <td style="padding: 16px 10px; text-align: right; color: #555; font-size: 14px; font-weight: 500;">₫` + price.toLocaleString() + `/Ngày</td>
                                        <td style="padding: 16px 10px; text-align: right; color: #b59349; font-size: 16px; font-weight: bold;">₫` + totalPrice.toLocaleString() + `</td>
                                    </tr>
                                 `;
                            });
                            
                            // Calculator items
                            const savedAsseccCal = document.querySelectorAll('#savedItemsContainer .form-box');
                            savedAsseccCal.forEach(formBox => {                              
                                 // Lấy nội dung từ thẻ h4 và data-rawprice
                                 const selects = formBox.querySelector('.form-check-select');
                                 const title = formBox.querySelector('h4') ? formBox.querySelector('h4').textContent.trim() : '?';
                                 const quantity = parseInt(selects ? selects.value : 0, 10) || 0;
                                 let price = 0;

                                 // Đọc raw price từ data attribute (chính xác nhất)
                                 const rawPriceAttr = selects ? selects.dataset.rawprice : null;
                                 if (rawPriceAttr && rawPriceAttr !== '0') {
                                     price = parseInt(rawPriceAttr, 10) || 0;
                                 } else {
                                     const priceLabel = formBox.querySelector('label[data-rawprice]');
                                     if (priceLabel) price = parseInt(priceLabel.dataset.rawprice, 10) || 0;
                                 }

                                 // Tính tổng giá
                                 const totalPrice = quantity * price;
                                 totalAmount += totalPrice;

                                 tableHtml += `
                                    <tr style="border-bottom: 1px dashed #eee;">
                                        <td style="padding: 16px 10px;">
                                            <h4 style="margin: 0; font-size: 15px; color: #444; font-weight: bold;">` + title + `</h4>
                                        </td>
                                        <td style="padding: 16px 10px; text-align: center; color: #aaa; font-size: 14px;">-</td>
                                        <td style="padding: 16px 10px; text-align: center; color: #555; font-size: 14px; font-weight: 500;">` + quantity + ` Cái</td>
                                        <td style="padding: 16px 10px; text-align: right; color: #555; font-size: 14px; font-weight: 500;">₫` + price.toLocaleString() + `</td>
                                        <td style="padding: 16px 10px; text-align: right; color: #555; font-size: 15px; font-weight: bold;">₫` + totalPrice.toLocaleString() + `</td>
                                    </tr>
                                 `;
                            });

                            tableHtml += `
                                        </tbody>
                                    </table>
                            `;

                            // Apply voucher discount if any
                            const appliedDiscount = parseInt(document.getElementById('applied-discount').value) || 0;
                            const finalAmount = Math.max(0, totalAmount - appliedDiscount);

                            let totalFooterHtml = '';
                            if (appliedDiscount > 0) {
                                // Giá gốc gạch ngang + dòng giảm + giá sau giảm
                                totalFooterHtml = `
                                    <div style="display:flex; justify-content:space-between; width:100%; align-items:center; margin-top:10px; padding-top:10px; border-top:2px solid #e0c87a;">
                                        <h4 style="margin:0; font-size:16px; color:#888;">Tạm tính:</h4>
                                        <span style="font-size:18px; color:#aaa; text-decoration:line-through; font-weight:600;">₫` + totalAmount.toLocaleString() + `</span>
                                    </div>
                                    <div style="display:flex; justify-content:space-between; width:100%; align-items:center; margin-top:6px;">
                                        <span style="font-size:14px; color:#16a34a; font-weight:600;">🎉 Voucher giảm:</span>
                                        <span style="font-size:15px; color:#16a34a; font-weight:700;">-₫` + appliedDiscount.toLocaleString() + `</span>
                                    </div>
                                    <div style="display:flex; justify-content:space-between; width:100%; align-items:center; margin-top:10px; padding-top:10px; border-top:1px dashed #e0c87a;">
                                        <h4 style="margin:0; font-size:18px; color:#333; font-weight:700;">Tổng thanh toán:</h4>
                                        <h2 id="dataInput" style="margin:0; font-size:26px; color:#b59349; font-weight:700;">₫` + finalAmount.toLocaleString() + `</h2>
                                    </div>
                                `;
                            } else {
                                totalFooterHtml = `
                                    <div style="display:flex; justify-content:space-between; width:100%; align-items:center; margin-top:10px; padding-top:10px; border-top:2px solid #e0c87a;">
                                        <h4 style="margin:0; font-size:18px; color:#333;">Tổng thanh toán:</h4>
                                        <h2 id="dataInput" style="margin:0; font-size:26px; color:#b59349; font-weight:700;">₫` + finalAmount.toLocaleString() + `</h2>
                                    </div>
                                `;
                            }

                            tableHtml += totalFooterHtml + `</div>`; // close wrapper div
                            
                            formBoxTotal.innerHTML = tableHtml;
                        }

                        function toggleNextButton() {
                               const checkbox =document.getElementById('daily-checkbox-term');
                               if (checkbox.checked) {
                                   nextButton.style.pointerEvents = 'auto';
                                   nextButton.style.color = '';
                                   nextButton.style.background = ''; nextButton.style.opacity = '1';
                               } else {
                                   nextButton.style.pointerEvents = 'none';
                                   nextButton.style.background = ''; nextButton.style.opacity = '0.5';
                                   nextButton.style.color = '';
                               }
                        }
                        
                        
                        
                        return true;
                    }


                });
                jQuery.extend(jQuery.validator.messages, {
                    required: "",
                    remote: "",
                    email: "",
                    url: "",
                    date: "",
                    dateISO: "",
                    number: "",
                    digits: "",
                    creditcard: "",
                    equalTo: ""
                });

                $.dobPicker({
                    daySelector: '#birth_date',
                    monthSelector: '#birth_month',
                    yearSelector: '#birth_year',
                    dayDefault: '',
                    monthDefault: '',
                    yearDefault: '',
                    minimumAge: 0,
                    maximumAge: 120
                });
                var marginSlider = document.getElementById('slider-margin');
                if (marginSlider != undefined) {
                    noUiSlider.create(marginSlider, {
                        start: [1100],
                        step: 100,
                        connect: [true, false],
                        tooltips: [true],
                        range: {
                            'min': 100,
                            'max': 2000
                        },
                        pips: {
                            mode: 'values',
                            values: [100, 2000],
                            density: 4
                        },
                        format: wNumb({
                            decimals: 0,
                            thousand: '',
                            prefix: '$ ',
                        })
                    });
                    var marginMin = document.getElementById('value-lower'),
                            marginMax = document.getElementById('value-upper');

                    marginSlider.noUiSlider.on('update', function (values, handle) {
                        if (handle) {
                            marginMax.innerHTML = values[handle];
                        } else {
                            marginMin.innerHTML = values[handle];
                        }
                    });
                }





            })(jQuery);
            
            
            document.addEventListener('DOMContentLoaded', () => {
                              
                const requiredFields = [
                    document.getElementById('pickupdate'),
                    document.getElementById('pickuptime'),
                    document.getElementById('returndate'),
                    document.getElementById('returntime'),
                    document.getElementById('pickuplocation'),
                    document.getElementById('returnlocation')
                ];
                
                // Function to format date to YYYY-MM-DD
                const formatDate = (date) => {
                    const d = new Date(date);
                    let month = '' + (d.getMonth() + 1);
                    let day = '' + d.getDate();
                    const year = d.getFullYear();

                    if (month.length < 2) month = '0' + month;
                    if (day.length < 2) day = '0' + day;

                    return [year, month, day].join('-');
                };
                
                const pickupdate = requiredFields[0];
                const returndate = requiredFields[2];
                // Set the min attribute for pickupdate
                const today = new Date();
                // today.setDate(today.getDate() + 1); // Minimum pick-up date is tomorrow
                pickupdate.min = formatDate(today);
                returndate.min = formatDate(today);
                
                pickupdate.addEventListener('change', () => {
                    const pickupdateValue = new Date(pickupdate.value);
                    pickupdateValue.setDate(pickupdateValue.getDate() + 1); // Minimum return date is one day after pick-up date
                    returndate.min = formatDate(pickupdateValue);

                    if (new Date(returndate.value) <= new Date(pickupdate.min)) {
                        returndate.value = formatDate(pickupdateValue);
                    }
                });
                
                returndate.addEventListener('change', () => {
                    // Không set max cho pickupdate để tránh giới hạn ngày nhận xe
                    if (new Date(returndate.value) <= new Date(pickupdate.min)) {
                        const returndateValue = new Date(returndate.value);
                        returndateValue.setDate(returndateValue.getDate() - 1);
                        pickupdate.value = formatDate(returndateValue);
                    }
                });

                // Initialize the values if they are empty
                if (!pickupdate.value) {
                    pickupdate.value = formatDate(today);
                }

                if (!returndate.value) {
                    const defaultReturnDate = new Date(pickupdate.value);
                    defaultReturnDate.setDate(defaultReturnDate.getDate() + 1);
                    returndate.value = formatDate(defaultReturnDate);
                }
                
                function checkFields() {
                    var nextButton = document.querySelector('.wizard .actions a[href="#next"]');
                    const allFieldsFilled = requiredFields.every(field => field.value.trim() !== '');
                    if (allFieldsFilled) {
                        nextButton.style.pointerEvents = 'auto';
                        nextButton.style.color = '';
                        nextButton.style.background = ''; nextButton.style.opacity = '1';
                    } else {
                        nextButton.style.pointerEvents = 'none';
                        nextButton.style.background = ''; nextButton.style.opacity = '0.5';
                        nextButton.style.color = '';

                         const currentStepIndex = 1;
                         const steps = document.querySelectorAll('.wizard ul[role="tablist"] li');

                         steps.forEach((step, index) => {
                             console.log(index);
                             if (index > currentStepIndex) {
                                 step.classList.remove('done');
                                 step.classList.add('disabled');
                             }
                         });
                    }
                }
                
                
                requiredFields.forEach(field => {
                    field.addEventListener('input', checkFields);
                    field.addEventListener('change', checkFields);
                });
                
               
                // Initial check in case some fields are pre-filled
                checkFields();
                
                // Image preview for CCCD/CMND
                document.querySelectorAll('input[type="file"][name^="image"]').forEach(fileInput => {
                    fileInput.addEventListener('change', function(event) {
                        const file = event.target.files[0];
                        const wrapper = fileInput.closest('.upload-card-wrapper');
                        const card = wrapper.querySelector('.upload-card');
                        const cardTitle = card ? card.querySelector('.upload-title') : null;
                        const cardSubtitle = card ? card.querySelector('.upload-subtitle') : null;
                        const cardIcon = card ? card.querySelector('i') : null;
                        const dynamicPreviewContainer = wrapper.querySelector('.image-preview-container:not(.existing-image)');
                        const existingPreviewContainer = wrapper.querySelector('.existing-image');

                        if (file) {
                            // Mark card as uploaded (green state)
                            if (card) card.classList.add('uploaded');
                            if (cardIcon) { cardIcon.className = 'bi bi-check-circle-fill'; }
                            if (cardTitle) cardTitle.textContent = '✓ Đã chọn: ' + file.name.substring(0, 20) + (file.name.length > 20 ? '...' : '');
                            if (cardSubtitle) cardSubtitle.textContent = 'Nhấn để thay đổi ảnh';

                            const reader = new FileReader();
                            reader.onload = function(e) {
                                if (dynamicPreviewContainer) {
                                    const img = dynamicPreviewContainer.querySelector('.img-preview');
                                    img.src = e.target.result;
                                    dynamicPreviewContainer.style.display = 'flex';
                                    dynamicPreviewContainer.style.position = 'relative';
                                    
                                    // Add clear button if not exists
                                    let clearBtn = dynamicPreviewContainer.querySelector('.clear-btn');
                                    if (!clearBtn) {
                                        clearBtn = document.createElement('button');
                                        clearBtn.className = 'clear-btn';
                                        clearBtn.innerHTML = '&times;';
                                        clearBtn.type = 'button';
                                        clearBtn.title = 'Xóa ảnh';
                                        clearBtn.style.position = 'absolute';
                                        clearBtn.style.top = '-10px';
                                        clearBtn.style.right = '-10px';
                                        clearBtn.style.background = '#dc2626';
                                        clearBtn.style.color = 'white';
                                        clearBtn.style.border = 'none';
                                        clearBtn.style.borderRadius = '50%';
                                        clearBtn.style.width = '24px';
                                        clearBtn.style.height = '24px';
                                        clearBtn.style.lineHeight = '1';
                                        clearBtn.style.cursor = 'pointer';
                                        clearBtn.style.boxShadow = '0 2px 4px rgba(0,0,0,0.2)';
                                        clearBtn.style.display = 'flex';
                                        clearBtn.style.alignItems = 'center';
                                        clearBtn.style.justifyContent = 'center';
                                        clearBtn.style.fontSize = '18px';
                                        clearBtn.style.fontWeight = 'bold';
                                        clearBtn.style.zIndex = '10';
                                        
                                        clearBtn.onclick = function(e) {
                                            e.stopPropagation();
                                            e.preventDefault();
                                            fileInput.value = '';
                                            fileInput.dispatchEvent(new Event('change'));
                                        };
                                        dynamicPreviewContainer.appendChild(clearBtn);
                                    }
                                }
                                if (existingPreviewContainer) {
                                    existingPreviewContainer.style.display = 'none';
                                }
                            };
                            reader.readAsDataURL(file);
                        } else {
                            // Reset card state
                            if (card) card.classList.remove('uploaded');
                            if (cardIcon) { cardIcon.className = fileInput.name === 'imageFront' ? 'bi bi-person-vcard' : 'bi bi-credit-card-2-back'; }
                            if (dynamicPreviewContainer) dynamicPreviewContainer.style.display = 'none';
                            if (existingPreviewContainer) existingPreviewContainer.style.display = 'flex';
                        }
                    });
                });
                
                // Add event listeners to validate form on image change
                const frontInput = document.getElementById('imageFront');
                const backInput = document.getElementById('imageBack');
                if (frontInput) frontInput.addEventListener('change', validateForm);
                if (backInput) backInput.addEventListener('change', validateForm);
                
            });
            
            document.addEventListener('DOMContentLoaded', () => {
                
                storedFormData = {
                        pickupdate: document.getElementById('pickupdate').value,                             
                        returndate: document.getElementById('returndate').value                    
                    };
                const pickupDateText = storedFormData.pickupdate;
                const returnDateText = storedFormData.returndate;
                
                
                // Chuyển các chuỗi ngày thành đối tượng Date
                const pickupDate = new Date(pickupDateText);
                const returnDate = new Date(returnDateText);
                
                console.log(pickupDate);
                console.log(returnDateText);
                
                // Tính số ngày chênh lệch
                const differenceInTime = returnDate.getTime() - pickupDate.getTime();
                const differenceInDays = differenceInTime / (1000 * 3600 * 24);
                
                
                
            });
            
            function validateIdentityCard() {
                const identityCard = document.getElementById('identityCard');
                return identityCard.value.length === 12;
            }
            
            function validateForm() {
                const requiredFields = [
                    document.getElementById('first_name'),
                    document.getElementById('last_name'),
                    document.getElementById('email'),
                    document.getElementById('phonenumber'),
                    document.getElementById('address'),
                    document.getElementById('dob'),
                    document.querySelector('input[name="gender"]:checked'),
                    document.getElementById('identityCard'),
                    document.getElementById('issuedon'),
                    document.getElementById('expdate')
                ];
                
                const allFieldsFilled = requiredFields.every(field => field && field.value.trim() !== '');
                const identityCardValid = validateIdentityCard();
                
                let filesValid = true;
                const custIdEl = document.getElementById('customerId');
                if (custIdEl && custIdEl.textContent.trim() === 'Not') {
                    const frontFile = document.getElementById('imageFront');
                    const backFile = document.getElementById('imageBack');
                    filesValid = (frontFile && frontFile.files.length > 0) && (backFile && backFile.files.length > 0);
                }
                
                var nextButton = document.querySelector('.wizard .actions a[href="#next"]');
                if (allFieldsFilled && identityCardValid && filesValid) {
                    nextButton.disabled = false;
                    nextButton.style.pointerEvents = 'auto';
                    nextButton.style.color = '';
                    nextButton.style.background = ''; nextButton.style.opacity = '1';
                } else {
                    nextButton.disabled = true;
                    nextButton.style.pointerEvents = 'none';
                    nextButton.style.background = ''; nextButton.style.opacity = '0.5';
                    nextButton.style.color = '';
                    
                    const currentStepIndex = 3;
                    const steps = document.querySelectorAll('.wizard ul[role="tablist"] li');

                    steps.forEach((step, index) => {

                        if (index > currentStepIndex) {
                            step.classList.remove('done');
                            step.classList.add('disabled');
                        }
                    });
                }
            }

            $("#motorcyclelist").on("change", ".form-check-select", function() {
               toggleBikeNextButton();
            });
            
           

            function updateSelectedBikesBanner() {
                const pickupInput = document.getElementById('pickupdate').value;
                const returnInput = document.getElementById('returndate').value;
                let activeBadgeText = "";
                if (pickupInput && returnInput) {
                    const start = new Date(pickupInput);
                    const end = new Date(returnInput);
                    const differenceInDays = Math.abs(end - start) / (1000 * 3600 * 24);
                    var quantityDay = Math.max(1, Math.ceil(differenceInDays));
                    if(quantityDay >= 30) {
                        activeBadgeText = " (Gói Tháng)";
                    } else if(quantityDay >= 7) {
                        activeBadgeText = " (Gói Tuần)";
                    }
                }
                
                const selectedBikesText = [];
                const selectBoxes = document.querySelectorAll('#motorcyclelist .form-check-select');
                selectBoxes.forEach(selectBox => {
                    const quantity = parseInt(selectBox.value);
                    if (quantity > 0) {
                        const formMotorBox = selectBox.closest('.form-box');
                        if (formMotorBox) {
                            const bikeName = formMotorBox.querySelector('.motor-name').textContent;
                            selectedBikesText.push(quantity + "x " + bikeName + activeBadgeText);
                        }
                    }
                });
                
                const banner = document.getElementById('selected-bikes-banner');
                const listSpan = document.getElementById('selected-bikes-list');
                if (selectedBikesText.length > 0) {
                    listSpan.textContent = selectedBikesText.join(", ");
                    banner.style.display = 'block';
                } else {
                    banner.style.display = 'none';
                }
            }

            function toggleBikeNextButton() {
                var nextButton = document.querySelector('.wizard .actions a[href="#next"]');
                // Kiểm tra nếu có bất kỳ select box nào có giá trị lớn hơn 0
                var anySelected = $(".form-check-select", "#motorcyclelist").toArray().some(function(select) {
                    return parseInt($(select).val()) > 0;
                });

                // Nếu có ít nhất một select box đã chọn, kích hoạt nút "Next"
                if (anySelected) {
                    nextButton.style.pointerEvents = 'auto';
                    nextButton.style.color = '';
                    nextButton.style.background = ''; nextButton.style.opacity = '1';
                    const checkboxContainer = document.getElementById('protection');
                    // Lấy tất cả các checkbox trong div
                    const checkboxes = checkboxContainer.querySelectorAll('.form-check-select');
                    // Lặp qua từng checkbox và lấy thông tin
                    checkboxes.forEach(selectBox => {
                        const quantity = parseInt(selectBox.value);                     
                        const formAccessBox = selectBox.closest('.form-box');
                        if (formAccessBox) {
                            numberAccessStatesI[selectBox.id] = quantity;
                        }
                    });
                    
                } else {
                    nextButton.style.pointerEvents = 'none';
                    nextButton.style.background = ''; nextButton.style.opacity = '0.5';
                    nextButton.style.color = '';

                     const currentStepIndex = 1;
                     const steps = document.querySelectorAll('.wizard ul[role="tablist"] li');

                     steps.forEach((step, index) => {
                       
                         if (index > currentStepIndex) {
                             step.classList.remove('done');
                             step.classList.add('disabled');
                         }
                     });
                }
            }
                            
            function incrementQuantity(motorcycleId) {
                var checkbox = document.getElementById('daily-checkbox-' + motorcycleId);
                var quantityInput = document.getElementById('daily-quantity-' + motorcycleId);
                quantityInput.value = parseInt(quantityInput.value) + 1;
                if (!checkbox.checked) {
                    checkbox.checked = true;
                    checkbox.parentElement.style.borderColor = '#28a745';
                }
                toggleBikeNextButton();
            }

            function decrementQuantity(motorcycleId) {
                var checkbox = document.getElementById('daily-checkbox-' + motorcycleId);
                var quantityInput = document.getElementById('daily-quantity-' + motorcycleId);
                if (quantityInput.value > 0) {
                    quantityInput.value = parseInt(quantityInput.value) - 1;
                    if(parseInt(quantityInput.value) === 0){
                        checkbox.checked = false;
                        checkbox.parentElement.style.borderColor = '';
                    }
                }
                toggleBikeNextButton();

            }
            
            function clearQuantity(motorcycleId) {
                var checkbox = document.getElementById('daily-checkbox-' + motorcycleId);
                var quantityInput = document.getElementById('daily-quantity-' + motorcycleId);              
                checkbox.checked = false;
                checkbox.parentElement.style.borderColor = '';
                quantityInput.value = 0;   
                toggleBikeNextButton();
            }
            
           

        window.addEventListener('message', (event) => {
            if (event.data === 'activateOverlay') {
                const overlay = document.getElementById('overlay');
                overlay.classList.add('active');
//                
//                // Thực hiện các hành động cần thiết tại đây, ví dụ: tắt overlay sau 3 giây
//                setTimeout(() => {
//                    overlay.classList.remove('active');
//                }, 30000000);
            }
            if(event.data === 'stopOverlay') {
                const overlay = document.getElementById('overlay');
                overlay.classList.remove('active');
            }
        });
           // Kiểm tra nếu có dữ liệu nào được gửi từ servlet
        function handlePaymentStatus(data) {
            if (data.status === 'success') {
                BookingHandler(data);
            }
        }
        
        window.addEventListener('storage', function(event) {
            console.log(event.key);
            if (event.key === 'payment_status') {
                var paymentStatus = JSON.parse(event.newValue);
                handlePaymentStatus(paymentStatus);
            }
        });

        
        function collectAccessoryData() {
            const accessories = [];
            const savedItemsContainer = document.getElementById('savedItemsContainer');
            // Lặp qua tất cả các phần tử có class "form-box"
            savedItemsContainer.querySelectorAll('.form-box').forEach(box => {
                const select = box.querySelector('.form-check-select');
                const quantity = parseInt(select.value);
                const id = select.id.split('-').pop();  // Lấy accessoryId từ id của select box
                const priceLabel = box.querySelector('.form-check .checkbox-container label');
                const priceText = priceLabel ? priceLabel.textContent.replace('₫', '').replace('.000', '').trim() : '0';
                const price = priceText.includes('Free') ? 0 : parseInt(priceText, 10);
                // Nếu số lượng lớn hơn 0, thêm vào danh sách
                if (quantity > 0) {
                    accessories.push({
                        id: id,
                        quantity: quantity.toString(),
                        price: parseInt(price)
                    });
                }
            });

            return accessories;
        }
        function BookingHandler(dataReturn) {
            var formData = new FormData();
            
//            alert("Thanh toán thành công với mã giao dịch: " + data.txnRef);
             // Lấy các giá trị từ các thẻ <p>
            var pickupDate = document.getElementById("pickupdatetext").textContent.trim();
            var pickupTime = document.getElementById("pickuptimetext").textContent.trim();
            var pickupLocation = document.getElementById("pickuploctext").textContent.trim();
            var returnLocation = document.getElementById("returnloctext").textContent.trim();
            var returnDate = document.getElementById("returndatetext").textContent.trim();
            var returnTime = document.getElementById("returntimetext").textContent.trim();
            var accountId = document.getElementById("accountId").textContent.trim();
            var fistname = document.getElementById("firstnametext").textContent.trim();
            var lastname = document.getElementById("lastnametext").textContent.trim();
            var phone = document.getElementById("phonetext").textContent.trim();
            var email = document.getElementById("emailaddresstext").textContent.trim();
            var address = document.getElementById("addresstext").textContent.trim();
            var dob = document.getElementById("birthdaytext").textContent.trim();
            var gender = document.getElementById("gendertext").textContent.trim();
            var customerId = document.getElementById("customerId").textContent.trim();
            var identityCard = document.getElementById("identityCard").value;
            var issuedon = document.getElementById("issuedon").value;
            var expdate = document.getElementById("expdate").value;
            var total = document.getElementById("dataInput").textContent.trim();
            
            
            // Chuyển các chuỗi ngày thành đối tượng Date
            const pickupD = new Date(pickupDate);
            const returnD = new Date(returnDate);

            // Tính số ngày chênh lệch
            const differenceInTime = returnD.getTime() - pickupD.getTime();
            const differenceInDays = differenceInTime / (1000 * 3600 * 24);
            
             // Quantity là số ngày chênh lệch giữa ngày trả và ngày pickup
            const quantityDay = Math.max(1, Math.ceil(differenceInDays));
            
            const bikeDetails = [];

            const checkboxMotorContainer = document.getElementById('savedBikeContainer');

            // tất cả các select box trong div
            const selectBoxes = checkboxMotorContainer.querySelectorAll('.form-check-select');

            // Lặp qua từng select box và lấy thông tin nếu giá trị lớn hơn 0
            selectBoxes.forEach(selectBox => {
                const quantity = parseInt(selectBox.value);
                if (quantity > 0) {
                    const formMotorBox = selectBox.closest('.form-box');
                    if (formMotorBox) {
                        const bikeName = formMotorBox.querySelector('.motor-name').textContent;
                        const bikePrice = formMotorBox.querySelector('.price-current').textContent;
                        const price = parseInt(bikePrice.replace('₫', '').replace('.000/Day', '').trim());
                        const totalPrice = quantityDay * price;
//                        const price = priceLabel ? priceLabel.textContent.replace('₫', '').replace('.000', '').trim() : 0;
                        // Lưu từng chiếc xe theo số lượng
                        for (let i = 0; i < quantity; i++) {                                                                                    
                            bikeDetails.push({ name: bikeName, price: totalPrice.toString() });
                        }
                    }
                }
            });
            const accessoriesData = collectAccessoryData();

            console.log(bikeDetails);
            console.log(accessoriesData);
            console.log(fistname);
            var data = {
                pickupDate: pickupDate + " " + pickupTime,
                pickupLocation: pickupLocation,
                returnLocation: returnLocation,
                returnDate: returnDate + " " + returnTime,
                accountId: accountId,          
                fistname : fistname,
                lastname : lastname, 
                phone : phone,
                email : email,
                address: address,
                dob: dob,
                gender: gender,
                customerId : customerId,
                identityCard : identityCard,
                issuedon : issuedon,
                expdate : expdate,
                bikeDetails: bikeDetails,
                accessories: accessoriesData,
                total : total,
                amount: dataReturn.amount,
                paymenttime: dataReturn.time,
                voucherId: document.getElementById('applied-voucher-id').value || '0'
            };
            
             // Convert object to JSON and append to formData
            formData.append("jsonData", JSON.stringify(data));

            // Add files to formData
            var fileInputFront = document.getElementById('imageFront');
            var fileInputBack = document.getElementById('imageBack');
            if (fileInputFront && fileInputFront.files.length > 0) {
                formData.append("fileFront", fileInputFront.files[0]);
            }
            if (fileInputBack && fileInputBack.files.length > 0) {
                formData.append("fileBack", fileInputBack.files[0]);
            }
            // Gửi dữ liệu tới servlet bằng AJAX
            $.ajax({
                type: "POST",
                url: "bookinghandler", // Thay đổi URL tới servlet của bạn
//                data: JSON.stringify(data),              
//                contentType: "application/json",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    console.log("Data sent successfully:", response);
                },
                error: function(xhr, status, error) {
                    console.error("Error sending data:", error);
                }
            });
            window.location.href = 'home';
        }

        // Nếu dữ liệu đã có sẵn trong LocalStorage khi trang được tải lại
        var existingStatus = localStorage.getItem('payment_status');
        if (existingStatus) {
            handlePaymentStatus(JSON.parse(existingStatus));
            localStorage.removeItem('payment_status');
        }
        
        
       

        // ===== VOUCHER FUNCTIONS =====
        function applyVoucher() {
            const code = document.getElementById('voucher-code-input').value.trim();
            const msgEl = document.getElementById('voucher-msg');
            if (!code) {
                msgEl.style.color = '#dc2626';
                msgEl.textContent = 'Vui lòng nhập mã voucher';
                return;
            }
            msgEl.style.color = '#6b7280';
            msgEl.textContent = 'Đang kiểm tra...';

            fetch('applyVoucher', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'code=' + encodeURIComponent(code)
            })
            .then(r => r.json())
            .then(data => {
                if (data.valid) {
                    document.getElementById('applied-voucher-id').value = data.voucherId;
                    document.getElementById('applied-discount').value = data.discount;
                    msgEl.style.color = '#16a34a';
                    msgEl.innerHTML = '✅ Áp dụng thành công! Giảm <strong>₫' + Number(data.discount).toLocaleString('vi-VN') + '</strong>'
                        + (data.description ? ' — ' + data.description : '');

                    // Lock voucher: 1 đơn hàng chỉ 1 voucher
                    const btn = document.getElementById('apply-voucher-btn');
                    const inp = document.getElementById('voucher-code-input');
                    if (btn) {
                        btn.textContent = '✓ Đã áp dụng';
                        btn.style.background = '#16a34a';
                        btn.disabled = true;
                        btn.style.opacity = '0.7';
                        btn.style.cursor = 'not-allowed';
                    }
                    if (inp) {
                        inp.disabled = true;
                        inp.style.background = '#f0fdf4';
                        inp.style.borderColor = '#16a34a';
                    }

                    // Re-render bảng tổng kết để hiện giá gạch ngang + giá mới
                    if (typeof buildStep5Table === 'function') buildStep5Table();
                } else {
                    msgEl.style.color = '#dc2626';
                    msgEl.textContent = '✗ ' + data.message;
                    resetVoucher();
                }
            })
            .catch(() => {
                msgEl.style.color = '#dc2626';
                msgEl.textContent = 'Lỗi kết nối, vui lòng thử lại';
            });
        }

        function resetVoucher() {
            document.getElementById('applied-voucher-id').value = '0';
            document.getElementById('applied-discount').value = '0';
            const btn = document.getElementById('apply-voucher-btn');
            if (btn) {
                btn.textContent = 'Áp dụng';
                btn.style.background = 'linear-gradient(135deg, #02b8af, #046fd4)';
            }
        }
        </script>
        <iframe id="myI" src="vnpay_return.jsp" style="width: 100%; height: 1000px; display:none;"></iframe>
<!--        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>-->
         
        <!-- Pre-fill from hero booking widget -->
        <script>
        (function() {
            try {
                var startDate = sessionStorage.getItem('hs_startDate');
                var endDate   = sessionStorage.getItem('hs_endDate');
                var pickup    = sessionStorage.getItem('hs_pickup');
                var returnL   = sessionStorage.getItem('hs_returnLoc');
                if (!startDate) return;

                // Fill date fields (split datetime-local → date + time)
                function splitDT(dtStr) {
                    if (!dtStr) return {date:'', time:''};
                    var parts = dtStr.split('T');
                    return { date: parts[0] || '', time: parts[1] ? parts[1].substring(0,5) : '' };
                }
                var sd = splitDT(startDate);
                var ed = splitDT(endDate);

                var pickupDateEl  = document.getElementById('pickupdate');
                var pickupTimeEl  = document.getElementById('pickuptime');
                var returnDateEl  = document.getElementById('returndate');
                var returnTimeEl  = document.getElementById('returntime');
                var pickupLocEl   = document.getElementById('pickuplocation');
                var returnLocEl   = document.getElementById('returnlocation');

                if (pickupDateEl && sd.date) pickupDateEl.value = sd.date;
                if (pickupTimeEl && sd.time) pickupTimeEl.value = sd.time;
                if (returnDateEl && ed.date) returnDateEl.value = ed.date;
                if (returnTimeEl && ed.time) returnTimeEl.value = ed.time;

                // Set location selects (match value or fallback to last option)
                function setSelectValue(sel, val) {
                    if (!sel || !val) return;
                    for (var i = 0; i < sel.options.length; i++) {
                        if (sel.options[i].value.toLowerCase().indexOf(val.substring(0,8).toLowerCase()) >= 0) {
                            sel.selectedIndex = i; return;
                        }
                    }
                }
                setSelectValue(pickupLocEl, pickup);
                setSelectValue(returnLocEl, returnL);

                // Clear so it doesn't re-apply on back navigation
                sessionStorage.removeItem('hs_startDate');
                sessionStorage.removeItem('hs_endDate');
                sessionStorage.removeItem('hs_pickup');
                sessionStorage.removeItem('hs_returnLoc');

                // Auto-advance logic has been removed as per user request
                // setTimeout(function() {
                //     var nextBtn = document.querySelector('a[href="#next"]') ||
                //                   document.querySelector('.actions a[href*="next"]') ||
                //                   document.querySelector('.wizard-next-btn') ||
                //                   document.querySelector('[data-action="next"]');
                //     if (nextBtn) nextBtn.click();
                // }, 800);

            } catch(ex) {}
        })();
        </script>

        <script>
        // ===== GÓI TUẦN / THÁNG QUICK SELECT =====
        window.activePackage = null;

        function setQuickReturnDate(days, autoEvent) {
            var pickupInput = document.getElementById('pickupdate');
            var returnInput = document.getElementById('returndate');
            if (!pickupInput.value) {
                alert('Vui lòng chọn Ngày nhận xe trước!');
                return;
            }
            if (!autoEvent) {
                window.activePackage = days === 7 ? 'week' : (days === 30 ? 'month' : null);
            }
            var date = new Date(pickupInput.value);
            date.setDate(date.getDate() + days);
            var yyyy = date.getFullYear();
            var mm = String(date.getMonth() + 1).padStart(2, '0');
            var dd = String(date.getDate()).padStart(2, '0');
            returnInput.value = yyyy + '-' + mm + '-' + dd;
            updateQuickButtonsStyle(days);
            returnInput.dispatchEvent(new Event('change'));
        }

        function updateQuickButtonsStyle(days) {
            var btnWeek = document.getElementById('btn-quick-week');
            var btnMonth = document.getElementById('btn-quick-month');
            if (btnWeek) {
                if (days === 7) {
                    btnWeek.style.background = '#b59349';
                    btnWeek.style.color = '#fff';
                } else {
                    btnWeek.style.background = '#fff';
                    btnWeek.style.color = '#b59349';
                }
            }
            if (btnMonth) {
                if (days === 30) {
                    btnMonth.style.background = '#b59349';
                    btnMonth.style.color = '#fff';
                } else {
                    btnMonth.style.background = '#fff';
                    btnMonth.style.color = '#b59349';
                }
            }
        }

        function bindPickupListener() {
            var pickupInput = document.getElementById('pickupdate');
            var returnInput = document.getElementById('returndate');
            if (!pickupInput || pickupInput._pkBound) return;
            pickupInput._pkBound = true;

            // Khi đổi ngày nhận xe: nếu đang chọn gói tuần/tháng thì tự cập nhật ngày trả
            pickupInput.addEventListener('change', function() {
                if (window.activePackage === 'week') {
                    setQuickReturnDate(7, true);
                } else if (window.activePackage === 'month') {
                    setQuickReturnDate(30, true);
                }
            });

            // Khi đổi ngày trả thủ công: detect xem có khớp gói nào không để highlight nút
            if (returnInput) {
                returnInput.addEventListener('change', function() {
                    if (pickupInput.value && returnInput.value) {
                        var start = new Date(pickupInput.value);
                        var end = new Date(returnInput.value);
                        var diffDays = Math.ceil(Math.abs(end - start) / (1000 * 60 * 60 * 24));
                        if (diffDays === 7) { window.activePackage = 'week'; updateQuickButtonsStyle(7); }
                        else if (diffDays === 30) { window.activePackage = 'month'; updateQuickButtonsStyle(30); }
                        else { window.activePackage = null; updateQuickButtonsStyle(0); }
                    }
                });
            }
        }

        // Gắn listener ngay khi DOM sẵn sàng (dù script chạy sớm hay muộn)
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', bindPickupListener);
        } else {
            bindPickupListener();
        }
        </script>

        <script>
        // ===== FIX NÚT BACK TRÌNH DUYỆT =====
        // Thay vì văng ra trang đăng nhập, nhấn Back sẽ lùi 1 bước trong wizard
        (function() {
            // Đẩy state vào history để bẫy sự kiện popstate
            history.pushState({ wizardStep: true }, '', window.location.href);
            window.addEventListener('popstate', function(event) {
                // Tìm nút "Previous" của jQuery Steps và click
                var prevBtn = document.querySelector('.wizard .actions a[href="#previous"]');
                if (prevBtn) {
                    prevBtn.click();
                    // Đẩy lại state để tiếp tục bẫy lần sau
                    history.pushState({ wizardStep: true }, '', window.location.href);
                }
            });
        })();

        // ===== FIX GIÁ TIỀN NaN Ở BƯỚC XÁC NHẬN =====
        // Khi bước xác nhận được hiển thị, tính lại tổng tiền
        document.addEventListener('DOMContentLoaded', function() {
            // Hook vào onStepChanged để recalculate khi vào bước 4 (Xác nhận)
            var origStepChanged = null;
            var checkInterval = setInterval(function() {
                var wizard = $('#signup-form > div');
                if (wizard.length && wizard.data('steps')) {
                    clearInterval(checkInterval);
                    wizard.on('stepChanged', function(event, currentIndex, priorIndex) {
                        if (currentIndex === 4) { // Bước Xác nhận (index 4)
                            recalcTotalOnConfirm();
                        }
                    });
                }
            }, 300);
        });

        function recalcTotalOnConfirm() {
            var pickupDate = document.getElementById('pickupdate') ? document.getElementById('pickupdate').value : '';
            var returnDate = document.getElementById('returndate') ? document.getElementById('returndate').value : '';
            if (!pickupDate || !returnDate) return;

            var start = new Date(pickupDate);
            var end   = new Date(returnDate);
            var diffMs   = Math.abs(end - start);
            var diffDays = Math.max(1, Math.ceil(diffMs / (1000 * 60 * 60 * 24)));

            // Tính tổng xe
            var bikeTotal = 0;
            document.querySelectorAll('#motorcyclelist .form-check-select').forEach(function(sel) {
                var qty = parseInt(sel.value) || 0;
                if (qty > 0) {
                    var box = sel.closest('.form-box');
                    if (box) {
                        // Lấy giá theo gói đang active (tuần/tháng/ngày)
                        var priceEl = null;
                        if (diffDays >= 30)      priceEl = box.querySelector('.price-month');
                        else if (diffDays >= 7)  priceEl = box.querySelector('.price-week');
                        else                     priceEl = box.querySelector('.price-day');
                        if (priceEl) {
                            var priceText = priceEl.textContent.replace(/[^0-9]/g, '');
                            var unitPrice = parseInt(priceText) * 100 || 0;
                            bikeTotal += qty * unitPrice * diffDays;
                        }
                    }
                }
            });

            // Tính tổng phụ kiện
            var accTotal = 0;
            document.querySelectorAll('.accessory-checkbox:checked').forEach(function(cb) {
                var row = cb.closest('tr') || cb.closest('.accessory-row');
                if (row) {
                    var qtyEl    = row.querySelector('.accessory-quantity');
                    var priceEl  = row.querySelector('.accessory-price');
                    if (qtyEl && priceEl) {
                        var qty   = parseInt(qtyEl.value) || 1;
                        var price = parseInt(priceEl.textContent.replace(/[^0-9]/g,'')) * 100 || 0;
                        accTotal += qty * price * diffDays;
                    }
                }
            });

            var total = bikeTotal + accTotal;
            var totalEl = document.getElementById('totaltext');
            var finalTotalInput = document.getElementById('finalTotal');
            var daysTotalInput  = document.getElementById('daysTotal');

            if (totalEl) {
                totalEl.textContent = '₫' + total.toLocaleString('vi-VN');
            }
            if (finalTotalInput) finalTotalInput.value = total;
            if (daysTotalInput)  daysTotalInput.value  = diffDays;
        }
        </script>

        <script>
        // ===== REALTIME BANNER XE ĐÃ CHỌN =====
        function updateBikeBanner() {
            var items = [];
            var selects = document.querySelectorAll('#motorcyclelist .form-check-select');
            selects.forEach(function(sel) {
                var qty = parseInt(sel.value) || 0;
                if (qty > 0) {
                    var box = sel.closest('.form-box');
                    if (box) {
                        var nameEl = box.querySelector('.motor-name');
                        if (nameEl) items.push(qty + ' x ' + nameEl.textContent.trim());
                    }
                }
            });
            var banner = document.getElementById('bike-selection-banner');
            var list   = document.getElementById('bike-selection-list');
            if (banner && list) {
                if (items.length > 0) {
                    list.innerHTML = items.map(function(item) {
                        return '<span style="display:inline-block; padding: 3px 10px; margin-right: 6px; margin-top: 4px; margin-bottom: 4px; background: #fff; border: 1px solid #e0c87a; border-radius: 6px; color: #b59349; font-weight: 600; font-size: 13px; box-shadow: 0 1px 2px rgba(0,0,0,0.02);">' + item + '</span>';
                    }).join('');
                    banner.style.display = 'block';
                } else {
                    banner.style.display = 'none';
                }
            }
        }

        // ===== REALTIME BANNER PHỤ KIỆN ĐÃ CHỌN =====
        function updateAccBanner() {
            var items = [];
            var selects = document.querySelectorAll('#protection .form-check-select');
            selects.forEach(function(sel) {
                var qty = parseInt(sel.value) || 0;
                if (qty > 0) {
                    var box = sel.closest('.form-box');
                    if (box) {
                        var nameEl = box.querySelector('h4');
                        if (nameEl) items.push(qty + ' x ' + nameEl.textContent.trim());
                    }
                }
            });
            var banner = document.getElementById('acc-selection-banner');
            var list   = document.getElementById('acc-selection-list');
            if (banner && list) {
                if (items.length > 0) {
                    list.innerHTML = items.map(function(item) {
                        return '<span style="display:inline-block; padding: 3px 10px; margin-right: 6px; margin-top: 4px; margin-bottom: 4px; background: #fff; border: 1px solid #16a34a; border-radius: 6px; color: #15803d; font-weight: 600; font-size: 13px; box-shadow: 0 1px 2px rgba(0,0,0,0.02);">' + item + '</span>';
                    }).join('');
                    banner.style.display = 'block';
                } else {
                    banner.style.display = 'none';
                }
            }
        }

        // Hook vào các select box để update banner realtime
        $(document).ready(function() {
            // Trigger cập nhật ngay khi load trang để xử lý các xe được pre-select
            updateBikeBanner();
            updateAccBanner();

            // Sử dụng jQuery event delegation để bắt chính xác event khi elements bị re-render bởi jquery-steps
            $(document).on('change', '.form-check-select', function(e) {
                var inMoto = $(this).closest('#motorcyclelist').length > 0;
                var inAcc  = $(this).closest('#protection').length > 0;
                if (inMoto) updateBikeBanner();
                if (inAcc)  updateAccBanner();
            });
        });

        // Voucher được xử lý qua hàm applyVoucher() ở script phía trên (kết nối servlet /applyVoucher → database)
        </script>
    </body>

</html>
