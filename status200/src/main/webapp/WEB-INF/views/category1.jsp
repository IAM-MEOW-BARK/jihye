<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>카테고리 리스트</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="author" content="" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/vendor.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">

    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
      crossorigin="anonymous"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none">
      <defs>
        

        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="menu"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M2 6a1 1 0 0 1 1-1h18a1 1 0 1 1 0 2H3a1 1 0 0 1-1-1m0 6.032a1 1 0 0 1 1-1h18a1 1 0 1 1 0 2H3a1 1 0 0 1-1-1m1 5.033a1 1 0 1 0 0 2h18a1 1 0 0 0 0-2z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="link"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M12 19a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm5 0a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm0-4a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm-5 0a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm7-12h-1V2a1 1 0 0 0-2 0v1H8V2a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v14a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V6a3 3 0 0 0-3-3Zm1 17a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-9h16Zm0-11H4V6a1 1 0 0 1 1-1h1v1a1 1 0 0 0 2 0V5h8v1a1 1 0 0 0 2 0V5h1a1 1 0 0 1 1 1ZM7 15a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm0 4a1 1 0 1 0-1-1a1 1 0 0 0 1 1Z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="arrow-right"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M17.92 11.62a1 1 0 0 0-.21-.33l-5-5a1 1 0 0 0-1.42 1.42l3.3 3.29H7a1 1 0 0 0 0 2h7.59l-3.3 3.29a1 1 0 0 0 0 1.42a1 1 0 0 0 1.42 0l5-5a1 1 0 0 0 .21-.33a1 1 0 0 0 0-.76Z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="category"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M19 5.5h-6.28l-.32-1a3 3 0 0 0-2.84-2H5a3 3 0 0 0-3 3v13a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3v-10a3 3 0 0 0-3-3Zm1 13a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-13a1 1 0 0 1 1-1h4.56a1 1 0 0 1 .95.68l.54 1.64a1 1 0 0 0 .95.68h7a1 1 0 0 1 1 1Z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="calendar"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M19 4h-2V3a1 1 0 0 0-2 0v1H9V3a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V7a3 3 0 0 0-3-3Zm1 15a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-7h16Zm0-9H4V7a1 1 0 0 1 1-1h2v1a1 1 0 0 0 2 0V6h6v1a1 1 0 0 0 2 0V6h2a1 1 0 0 1 1 1Z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="heart"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M20.16 4.61A6.27 6.27 0 0 0 12 4a6.27 6.27 0 0 0-8.16 9.48l7.45 7.45a1 1 0 0 0 1.42 0l7.45-7.45a6.27 6.27 0 0 0 0-8.87Zm-1.41 7.46L12 18.81l-6.75-6.74a4.28 4.28 0 0 1 3-7.3a4.25 4.25 0 0 1 3 1.25a1 1 0 0 0 1.42 0a4.27 4.27 0 0 1 6 6.05Z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="plus"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M19 11h-6V5a1 1 0 0 0-2 0v6H5a1 1 0 0 0 0 2h6v6a1 1 0 0 0 2 0v-6h6a1 1 0 0 0 0-2Z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="minus"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M19 11H5a1 1 0 0 0 0 2h14a1 1 0 0 0 0-2Z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="cart"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M8.5 19a1.5 1.5 0 1 0 1.5 1.5A1.5 1.5 0 0 0 8.5 19ZM19 16H7a1 1 0 0 1 0-2h8.491a3.013 3.013 0 0 0 2.885-2.176l1.585-5.55A1 1 0 0 0 19 5H6.74a3.007 3.007 0 0 0-2.82-2H3a1 1 0 0 0 0 2h.921a1.005 1.005 0 0 1 .962.725l.155.545v.005l1.641 5.742A3 3 0 0 0 7 18h12a1 1 0 0 0 0-2Zm-1.326-9l-1.22 4.274a1.005 1.005 0 0 1-.963.726H8.754l-.255-.892L7.326 7ZM16.5 19a1.5 1.5 0 1 0 1.5 1.5a1.5 1.5 0 0 0-1.5-1.5Z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="check"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M18.71 7.21a1 1 0 0 0-1.42 0l-7.45 7.46l-3.13-3.14A1 1 0 1 0 5.29 13l3.84 3.84a1 1 0 0 0 1.42 0l8.16-8.16a1 1 0 0 0 0-1.47Z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="trash"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M10 18a1 1 0 0 0 1-1v-6a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1ZM20 6h-4V5a3 3 0 0 0-3-3h-2a3 3 0 0 0-3 3v1H4a1 1 0 0 0 0 2h1v11a3 3 0 0 0 3 3h8a3 3 0 0 0 3-3V8h1a1 1 0 0 0 0-2ZM10 5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v1h-4Zm7 14a1 1 0 0 1-1 1H8a1 1 0 0 1-1-1V8h10Zm-3-1a1 1 0 0 0 1-1v-6a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1Z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="search"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="close"
          viewBox="0 0 15 15"
        >
          <path
            fill="currentColor"
            d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z"
          />
        </symbol>

        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="package"
          viewBox="0 0 48 48"
        >
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="m24 13.264l7.288 4.21L24 21.681l-7.288-4.209Z"
          />
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M16.712 17.473v8.418L24 30.101l7.288-4.21v-8.418M24 30.1v-8.418"
          />
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M40.905 21.405a16.905 16.905 0 1 0-23.389 15.611L24 43.5l6.484-6.484a16.906 16.906 0 0 0 10.42-15.611"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="secure"
          viewBox="0 0 48 48"
        >
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M14.134 36V20.11h19.732M19.279 36h14.587V25.45"
          />
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="m19.246 26.606l4.135 4.135l5.373-5.372m-8.934-9.282a4.087 4.087 0 1 1 8.174 0m0 0v4.023m-8.172-4.108v4.108"
          />
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M30.288 44.566a21.516 21.516 0 1 1 9.69-6.18"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="quality"
          viewBox="0 0 48 48"
        >
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="m30.59 13.45l4.77 2.94L24 34.68l-10.33-7l3.11-4.6l5.52 3.71l8.26-13.38Z"
          />
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M24 4.5s-11.26 2-15.25 2v20a11.16 11.16 0 0 0 .8 4.1a15 15 0 0 0 2 3.61a22 22 0 0 0 2.81 3.07a34.47 34.47 0 0 0 3 2.48a34 34 0 0 0 2.89 1.86c1 .59 1.71 1 2.13 1.19l1 .49a1.44 1.44 0 0 0 1.24 0l1-.49c.42-.2 1.13-.6 2.13-1.19a34 34 0 0 0 2.89-1.86a34.47 34.47 0 0 0 3-2.48a22 22 0 0 0 2.81-3.07a15 15 0 0 0 2-3.61a11.16 11.16 0 0 0 .8-4.1v-20c-3.99.03-15.25-2-15.25-2"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="savings"
          viewBox="0 0 48 48"
        >
          <circle
            cx="24"
            cy="24"
            r="21.5"
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
          />
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M12.5 23.684a3.298 3.298 0 0 1 5.63-2.332l3.212 3.212h0l8.53-8.53a3.298 3.298 0 0 1 5.628 2.333h0c0 .875-.348 1.714-.966 2.333L22.983 32.25a2.321 2.321 0 0 1-3.283 0l-6.234-6.233a3.298 3.298 0 0 1-.966-2.333"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="offers"
          viewBox="0 0 48 48"
        >
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="m41.556 39.297l-22.022 3.11a1.097 1.097 0 0 1-1.245-.97l-2.352-22.311a1.097 1.097 0 0 1 1.08-1.213l24.238-.229a1.097 1.097 0 0 1 1.108 1.09l.137 19.429c.004.55-.4 1.017-.944 1.094M26.1 25.258v2.579m8.494-2.731v2.175"
          />
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M34.343 32.346c-1.437.828-1.926 1.198-2.774 1.988c-1.19-.457-2.284-1.228-3.797-1.456m-15.953 8.721l-3.49-1.6a1.12 1.12 0 0 1-.643-.863L5.511 23.593c-.056-.4.108-.8.43-1.046l3.15-2.406a1.257 1.257 0 0 1 2.014.874l1.966 19.69a.887.887 0 0 1-1.252.894m11.989-28.112c.214-.456.964-1.716 2.76-3.618c3.108-3.323 4.26-4.288 4.26-4.288s1.42.75 3.27 3.109c1.876 2.358 1.93 3.832 1.93 3.832s.67-.08-4.797 1.688c-3.055.991-4.368 1.152-4.931 1.152"
          />
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M26.97 17.828v-.054c0-.884-.241-1.715-.67-2.412c-.563-.91-1.447-1.608-2.492-1.876a3.58 3.58 0 0 0-1.072-.16c-.429 0-.858.053-1.233.214c-1.152.348-2.063 1.18-2.573 2.278a4.747 4.747 0 0 0-.428 1.956v.134"
          />
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M18.93 15.818c-.562-.107-1.5-.349-3.135-.884c-2.304-.75-3.43-1.528-3.43-1.528s-.456-1.393 1.045-3.296s2.653-2.52 2.653-2.52s.911.778 3.43 3.485c1.26 1.313 1.796 2.09 2.01 2.465h.027"
          />
        </symbol>

        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="delivery"
          viewBox="0 0 32 32"
        >
          <path
            fill="currentColor"
            d="m29.92 16.61l-3-7A1 1 0 0 0 26 9h-3V7a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v17a1 1 0 0 0 1 1h2.14a4 4 0 0 0 7.72 0h6.28a4 4 0 0 0 7.72 0H29a1 1 0 0 0 1-1v-7a1 1 0 0 0-.08-.39M23 11h2.34l2.14 5H23ZM9 26a2 2 0 1 1 2-2a2 2 0 0 1-2 2m10.14-3h-6.28a4 4 0 0 0-7.72 0H4V8h17v12.56A4 4 0 0 0 19.14 23M23 26a2 2 0 1 1 2-2a2 2 0 0 1-2 2m5-3h-1.14A4 4 0 0 0 23 20v-2h5Z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="organic"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M0 2.84c1.402 2.71 1.445 5.241 2.977 10.4c1.855 5.341 8.703 5.701 9.21 5.711c.46.726 1.513 1.704 3.926 2.21l.268-1.272c-2.082-.436-2.844-1.239-3.106-1.68l-.005.006c.087-.484 1.523-5.377-1.323-9.352C7.182 3.583 0 2.84 0 2.84m24 .84c-3.898.611-4.293-.92-11.473 3.093a11.879 11.879 0 0 1 2.625 10.05c3.723-1.486 5.166-3.976 5.606-6.466c0 0 1.27-4.716 3.242-6.677M12.527 6.773l-.002-.002v.004zM2.643 5.22s5.422 1.426 8.543 11.543c-2.945-.889-4.203-3.796-4.63-5.168h.006a15.863 15.863 0 0 0-3.92-6.375z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="fresh"
          viewBox="0 0 24 24"
        >
          <g fill="none">
            <path
              d="M24 0v24H0V0zM12.594 23.258l-.012.002l-.071.035l-.02.004l-.014-.004l-.071-.036c-.01-.003-.019 0-.024.006l-.004.01l-.017.428l.005.02l.01.013l.104.074l.015.004l.012-.004l.104-.074l.012-.016l.004-.017l-.017-.427c-.002-.01-.009-.017-.016-.018m.264-.113l-.014.002l-.184.093l-.01.01l-.003.011l.018.43l.005.012l.008.008l.201.092c.012.004.023 0 .029-.008l.004-.014l-.034-.614c-.003-.012-.01-.02-.02-.022m-.715.002a.023.023 0 0 0-.027.006l-.006.014l-.034.614c0 .012.007.02.017.024l.015-.002l.201-.093l.01-.008l.003-.011l.018-.43l-.003-.012l-.01-.01z"
            />
            <path
              fill="currentColor"
              d="M20 9a1 1 0 0 1 1 1v1a8 8 0 0 1-8 8H9.414l.793.793a1 1 0 0 1-1.414 1.414l-2.496-2.496a.997.997 0 0 1-.287-.567L6 17.991a.996.996 0 0 1 .237-.638l.056-.06l2.5-2.5a1 1 0 0 1 1.414 1.414L9.414 17H13a6 6 0 0 0 6-6v-1a1 1 0 0 1 1-1m-4.793-6.207l2.5 2.5a1 1 0 0 1 0 1.414l-2.5 2.5a1 1 0 1 1-1.414-1.414L14.586 7H11a6 6 0 0 0-6 6v1a1 1 0 1 1-2 0v-1a8 8 0 0 1 8-8h3.586l-.793-.793a1 1 0 0 1 1.414-1.414"
            />
          </g>
        </symbol>

        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="star-full"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="m3.1 11.3l3.6 3.3l-1 4.6c-.1.6.1 1.2.6 1.5c.2.2.5.3.8.3c.2 0 .4 0 .6-.1c0 0 .1 0 .1-.1l4.1-2.3l4.1 2.3s.1 0 .1.1c.5.2 1.1.2 1.5-.1c.5-.3.7-.9.6-1.5l-1-4.6c.4-.3 1-.9 1.6-1.5l1.9-1.7l.1-.1c.4-.4.5-1 .3-1.5s-.6-.9-1.2-1h-.1l-4.7-.5l-1.9-4.3s0-.1-.1-.1c-.1-.7-.6-1-1.1-1c-.5 0-1 .3-1.3.8c0 0 0 .1-.1.1L8.7 8.2L4 8.7h-.1c-.5.1-1 .5-1.2 1c-.1.6 0 1.2.4 1.6"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="star-half"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="m3.1 11.3l3.6 3.3l-1 4.6c-.1.6.1 1.2.6 1.5c.2.2.5.3.8.3c.2 0 .4 0 .6-.1c0 0 .1 0 .1-.1l4.1-2.3l4.1 2.3s.1 0 .1.1c.5.2 1.1.2 1.5-.1c.5-.3.7-.9.6-1.5l-1-4.6c.4-.3 1-.9 1.6-1.5l1.9-1.7l.1-.1c.4-.4.5-1 .3-1.5s-.6-.9-1.2-1h-.1l-4.7-.5l-1.9-4.3s0-.1-.1-.1c-.1-.7-.6-1-1.1-1c-.5 0-1 .3-1.3.8c0 0 0 .1-.1.1L8.7 8.2L4 8.7h-.1c-.5.1-1 .5-1.2 1c-.1.6 0 1.2.4 1.6m8.9 5V5.8l1.7 3.8c.1.3.5.5.8.6l4.2.5l-3.1 2.8c-.3.2-.4.6-.3 1c0 .2.5 2.2.8 4.1l-3.6-2.1c-.2-.2-.3-.2-.5-.2"
          />
        </symbol>

       

        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="fruits"
          viewBox="0 0 48 48"
        >
          <g fill="currentColor" fill-rule="evenodd" clip-rule="evenodd">
            <path
              d="M18.88 7.566a1 1 0 0 1 1 1v6.6a1 1 0 1 1-2 0v-6.6a1 1 0 0 1 1-1"
            />
            <path
              d="M11.78 13.905c1.13-.27 2.283-.065 3.48.553c.975.505 1.667.736 2.206.847c.538.112.966.114 1.483.114v2h-.02c-.516 0-1.12 0-1.868-.155c-.757-.157-1.622-.462-2.72-1.03c-.878-.453-1.54-.517-2.096-.384c-.584.14-1.201.53-1.912 1.264c-1.632 1.688-2.139 3.426-2.316 4.762c-.1 1.644.197 4.89 1.668 8.063c.5 1.08 1.21 2.57 2.076 3.737c.432.582.866 1.03 1.283 1.306c.405.267.741.34 1.046.288c3.123-.538 3.71-.551 4.319-.551h1.037v2H18.38c-.422 0-.92 0-3.95.522c-.94.162-1.787-.127-2.488-.59c-.689-.455-1.284-1.106-1.787-1.783c-1.005-1.353-1.791-3.024-2.284-4.088c-1.638-3.532-1.972-7.137-1.848-9.064l.003-.032l.004-.032c.212-1.644.844-3.839 2.866-5.928c.845-.874 1.783-1.556 2.885-1.82"
            />
            <path
              d="M14.64 11.41c1.496 1.431 2.307 3.166 2.307 4.51a1 1 0 1 0 2 0c0-2.05-1.168-4.275-2.925-5.956C14.244 8.265 11.743 7 8.896 7a1 1 0 0 0 0 2c2.244 0 4.268.999 5.743 2.41"
            />
            <path
              d="M8.574 7.009a1 1 0 0 1 1.116.868c.492 3.93 3.945 6 6.734 7.115a1 1 0 0 1-.743 1.857c-2.869-1.147-7.335-3.604-7.975-8.724a1 1 0 0 1 .868-1.116m17.188 6.894c-1.152-.264-2.334-.066-3.57.548c-1.02.506-1.747.74-2.317.853c-.57.113-1.022.115-1.56.115a1 1 0 0 0 0 2h.019c.537 0 1.16 0 1.93-.153c.781-.155 1.676-.458 2.816-1.024c.924-.458 1.632-.528 2.236-.39c.626.144 1.277.542 2.017 1.277c1.716 1.703 2.235 3.452 2.414 4.784a1 1 0 0 0 1.982-.266c-.222-1.653-.884-3.85-2.987-5.938c-.881-.874-1.85-1.548-2.98-1.806m.945 20.377a1 1 0 0 0-1.414.027c-.757.786-1.393 1.05-1.931.962c-3.252-.538-3.86-.55-4.485-.55a1 1 0 0 0 0 2h.028c.447 0 .967 0 4.13.523c1.522.252 2.785-.599 3.699-1.548a1 1 0 0 0-.027-1.415"
            />
            <path
              d="M32.65 16.103c-1.003 1.81-1.263 3.709-.864 4.992a1 1 0 1 1-1.91.594c-.609-1.959-.153-4.43 1.025-6.556c1.193-2.152 3.206-4.101 5.925-4.947a1 1 0 1 1 .594 1.91c-2.143.666-3.78 2.222-4.77 4.007"
            />
            <path
              d="M34.719 17.379c-1.168 1.71-2.748 2.793-4.073 3.013a1 1 0 1 0 .326 1.973c2.023-.335 4.027-1.851 5.398-3.858c1.388-2.032 2.227-4.706 1.762-7.515a1 1 0 1 0-1.974.326c.367 2.214-.288 4.375-1.44 6.06"
            />
            <path
              d="M31.78 23a2.5 2.5 0 1 0 0 5a2.5 2.5 0 0 0 0-5m-4.5 2.5a4.5 4.5 0 1 1 9 0a4.5 4.5 0 0 1-9 0"
            />
            <path
              d="M37.845 18.09a4.5 4.5 0 0 1 2.716 5.755a1 1 0 1 1-1.883-.675a2.5 2.5 0 1 0-4.706-1.69a1 1 0 0 1-1.882-.675a4.5 4.5 0 0 1 5.755-2.715"
            />
            <path
              d="M36.253 23.176a4.501 4.501 0 0 1 3.822 8.014a1 1 0 1 1-1.144-1.64a2.5 2.5 0 1 0-3.008-3.99a1 1 0 1 1-1.262-1.552a4.501 4.501 0 0 1 1.592-.832M27.78 29a2.5 2.5 0 1 0 0 5a2.5 2.5 0 0 0 0-5m-4.5 2.5a4.5 4.5 0 1 1 9 0a4.5 4.5 0 0 1-9 0"
            />
            <path
              d="M35.78 29a2.5 2.5 0 1 0 0 5a2.5 2.5 0 0 0 0-5m-4.5 2.5a4.5 4.5 0 1 1 9 0a4.5 4.5 0 0 1-9 0"
            />
            <path
              d="M31.78 35a2.5 2.5 0 1 0 0 5a2.5 2.5 0 0 0 0-5m-4.5 2.5a4.5 4.5 0 1 1 9 0a4.5 4.5 0 0 1-9 0"
            />
            <path
              d="M37.834 33.966a1 1 0 0 1 1.278-.606a4.5 4.5 0 1 1-4.675 7.44a1 1 0 1 1 1.405-1.423a2.5 2.5 0 1 0 2.598-4.133a1 1 0 0 1-.606-1.278"
            />
          </g>
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="dairy"
          viewBox="0 0 48 48"
        >
          <g fill="none">
            <path d="M0 0h48v48H0z" />
            <path
              fill="currentColor"
              fill-rule="evenodd"
              d="M10 5a1 1 0 0 1 1-1h18.571a1 1 0 0 1 .559.17l7.428 5A1 1 0 0 1 38 10v33a1 1 0 0 1-1 1H18.429a1 1 0 0 1-.559-.17l-7.428-5A1 1 0 0 1 10 38zm2 1.878v2.494a2 2 0 0 0 .168.802l1.985 4.539a1 1 0 0 0 1.67.258l.682-.781A2 2 0 0 0 17 12.873v-2.63zM19 11v31h17V11zm14.723-2h-14.99l-4.456-3h14.99zM36 23a8 8 0 1 0-16 0a8 8 0 0 0 16 0M17 40.833V16.61a2.964 2.964 0 0 1-2 .702v22.175zm-4-2.692V16.5h.012a2.997 2.997 0 0 1-.691-.986L12 14.781v22.687zM28 17a6 6 0 1 0 0 12a6 6 0 0 0 0-12m-4 5a1 1 0 0 1 1-1h6v2h-6a1 1 0 0 1-1-1m2 3a1 1 0 0 1 1-1h2v2h-2a1 1 0 0 1-1-1"
              clip-rule="evenodd"
            />
          </g>
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="meat"
          viewBox="0 0 48 48"
        >
          <g fill="currentColor">
            <path d="M14 14a1 1 0 1 0 0-2a1 1 0 0 0 0 2" />
            <path
              fill-rule="evenodd"
              d="M15.086 6c1.26-1.26 3.414-.368 3.414 1.414V9h1.586c1.782 0 2.674 2.154 1.414 3.414l-1.793 1.793a1.138 1.138 0 0 1-.037.036l3.456 5.847a4 4 0 0 0 4.08 1.914l12.58-2.027c1.63-.263 2.74 1.609 1.728 2.914c-.97 1.251-1.459 2.85-1.812 4.6C38.384 34.02 32.854 39.052 26 39.88V42h2.5v2H19v-2h5v-2c-5.414 0-10.21-2.607-13.107-6.608c-2.324-3.21-1.946-7.335-1.006-10.767l.495-1.805a6.996 6.996 0 0 0 .181-2.822L10.5 18H7.914C6.132 18 5.24 15.846 6.5 14.586zm5 5l-1.466 1.466l-.73-1.233a4.55 4.55 0 0 0-.307-.455c.275.142.586.222.917.222zM16.5 9c0 .334.082.65.227.926a4.548 4.548 0 0 0-1.894-.845L16.5 7.414zm-8.586 7l1.595-1.594c.04.208.096.416.168.624l.334.97zm3.654-1.622a2.548 2.548 0 0 1 4.601-2.127l5.236 8.857a6 6 0 0 0 6.119 2.87l12.148-1.957c-1.082 1.557-1.589 3.383-1.93 5.075a13.09 13.09 0 0 1-1.419 3.815a.999.999 0 0 0-.247.222C34.183 33.513 31.378 35 28.264 35C22.654 35 18 30.136 18 24a1 1 0 0 0-2 0c0 7.12 5.432 13 12.264 13c.4 0 .794-.02 1.184-.06A14.402 14.402 0 0 1 24 38c-4.763 0-8.96-2.291-11.487-5.78c-1.766-2.439-1.6-5.773-.697-9.066l.495-1.806a8.998 8.998 0 0 0-.171-5.311z"
              clip-rule="evenodd"
            />
          </g>
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="seafood"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M13.497 4.564c1.649-.906 3.859-1.137 6.669-.694c.119.685.221 1.711.147 2.86c-.102 1.572-.53 3.278-1.602 4.656l-.165.212l-.036.263v.002l-.002.014l-.013.074a9.298 9.298 0 0 1-1.294 3.217l-.84-1.688l-.96.72C13.65 15.513 10.903 16 9 16H8v1c0 .77-.004 1.293-.106 1.804a3.722 3.722 0 0 1-.147.53l-4.011-4.012a8.2 8.2 0 0 1 .978-.209A10.285 10.285 0 0 1 5.985 15H7v-1c0-2.697.864-3.993 1.83-5.442L9.202 8L7.428 5.339a9.688 9.688 0 0 1 1.765-.411c.609-.088 1.228-.13 1.773-.123c.202.002.385.012.548.026c.09.768.373 1.643.861 2.475c.725 1.236 1.938 2.442 3.774 3.13l.936.351l.703-1.872l-.937-.351c-1.364-.512-2.234-1.39-2.75-2.27c-.385-.655-.557-1.28-.604-1.73m6.947 7.845c1.285-1.759 1.752-3.81 1.865-5.55c.117-1.806-.14-3.371-.344-4.121l-.164-.605l-.616-.116c-3.425-.643-6.471-.492-8.855.91a7.649 7.649 0 0 0-1.338-.122c-.66-.009-1.383.042-2.083.143c-.698.1-1.397.252-2.004.455c-.575.193-1.193.471-1.612.89l-.58.58L6.8 8.003c-.813 1.256-1.6 2.711-1.767 5.054c-.19.02-.4.045-.622.08c-.857.131-2.032.409-2.965 1.03l-1.015.678l7.725 7.725l.676-1.015c.563-.845.87-1.59 1.024-2.359c.083-.413.118-.823.133-1.231c1.704-.117 3.837-.545 5.612-1.523l1.12 2.25l.983-.983c1.188-1.189 1.88-2.582 2.273-3.653a11.298 11.298 0 0 0 .467-1.646M17.5 4.58l1.417 1.417L17.5 7.414l-1.417-1.417z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="bakery"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M19.87 17.412q.828.436 1.365-.206q.536-.643.138-1.414l-1.911-3.584l-1.666 4.123zm-5.308-.912h2.084l2.439-6.027q.228-.565.077-.914q-.15-.35-.57-.52l-2-.8q-.455-.19-.88-.047q-.424.145-.474.639zm-7.208 0h2.084l-.676-7.746q-.05-.39-.455-.548q-.405-.158-.9.032l-2 .8q-.45.19-.527.598q-.078.406.112.914zm-3.223.912l2.073-1.081l-1.627-4.123l-1.95 3.661q-.437.79.148 1.366q.585.575 1.356.177m6.307-.912h3.124l.788-8.912q.05-.455-.228-.772q-.278-.316-.772-.316h-2.7q-.373 0-.709.288t-.291.724zM3.53 18.538q-.87 0-1.45-.595q-.579-.595-.579-1.44q0-.28.068-.548q.069-.268.194-.524L4.077 11q-.33-.865-.08-1.715q.25-.85 1.045-1.173l2-.8q.427-.183.873-.185q.447-.002.797.265q.08-.782.628-1.337q.548-.555 1.34-.555h2.67q.78 0 1.338.526t.677 1.29q.293-.281.739-.225q.446.057.854.22l2 .8q.807.324 1.092 1.164q.285.84-.088 1.675l2.315 4.43q.111.218.186.437t.075.456q0 .933-.647 1.6q-.647.665-1.57.665q-.227 0-.431-.052q-.205-.053-.41-.16l-1.626-.826H6.134l-1.515.788q-.248.137-.524.194q-.276.056-.566.056m8.49-6.519"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="canned"
          viewBox="0 0 32 32"
        >
          <g fill="none">
            <g
              fill="currentColor"
              clip-path="url(#fluentEmojiHighContrastCannedFood0)"
            >
              <path
                d="M8 5.04h16v5.03h-2.239a7.977 7.977 0 0 0-5.771-2.46a7.977 7.977 0 0 0-5.771 2.46H8zm13.846 16.02H24v5.98H8v-5.98h2.134a7.978 7.978 0 0 0 5.856 2.55a7.978 7.978 0 0 0 5.856-2.55m-8.196-8.265a2.232 2.232 0 0 1-1.7-2.165h2.29c.71 0 1.344.333 1.752.852a2.232 2.232 0 0 1 1.768-.862h2.28a2.233 2.233 0 0 1-1.723 2.172a3.952 3.952 0 0 1-.757 7.828h-3.14c-2.18 0-3.95-1.77-3.95-3.95a3.954 3.954 0 0 1 3.18-3.875"
              />
              <path
                d="M3 3.52A3.52 3.52 0 0 1 6.52 0h18.3a3.52 3.52 0 0 1 2.17 6.292v19.5a3.532 3.532 0 0 1 1.35 2.778a3.52 3.52 0 0 1-3.52 3.52H6.52A3.52 3.52 0 0 1 3 28.57a3.54 3.54 0 0 1 2-3.185V6.696A3.52 3.52 0 0 1 3 3.52M24.82 2H6.52a1.52 1.52 0 1 0 0 3.04H7v22h-.48c-.84 0-1.52.69-1.52 1.53c0 .84.68 1.52 1.52 1.52h18.3c.84 0 1.52-.68 1.52-1.52c0-.78-.585-1.43-1.34-1.52V5.03A1.52 1.52 0 0 0 24.82 2"
              />
            </g>
            <defs>
              <clipPath id="fluentEmojiHighContrastCannedFood0">
                <path fill="#fff" d="M0 0h32v32H0z" />
              </clipPath>
            </defs>
          </g>
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="frozen"
          viewBox="0 0 24 24"
        >
          <g fill="none" stroke="currentColor" stroke-width="1.5">
            <path
              d="M4 10c0-3.771 0-5.657 1.172-6.828C6.343 2 8.229 2 12 2c3.771 0 5.657 0 6.828 1.172C20 4.343 20 6.229 20 10v3c0 3.771 0 5.657-1.172 6.828C17.657 21 15.771 21 12 21c-3.771 0-5.657 0-6.828-1.172C4 18.657 4 16.771 4 13z"
            />
            <path stroke-linejoin="round" d="M17 21v1h-1v-1m-8 0v1H7v-1" />
            <path d="M20 11.5H4" />
            <path stroke-linecap="round" d="M17 7v2m0 5v2" />
          </g>
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="pasta"
          viewBox="0 0 32 32"
        >
          <path
            fill="currentColor"
            d="m11.414 15l-8-8L2 8.414L8.586 15H2v1a14 14 0 0 0 28 0v-1ZM16 28A12.017 12.017 0 0 1 4.042 17h23.917A12.017 12.017 0 0 1 16 28"
          />
          <path
            fill="currentColor"
            d="M22 8a5.005 5.005 0 0 0-1.57.255A8.024 8.024 0 0 0 14 5a7.936 7.936 0 0 0-4.906 1.68L4.414 2L3 3.414l6.05 6.05l.707-.707A5.96 5.96 0 0 1 14 7a6.02 6.02 0 0 1 4.688 2.264a5.06 5.06 0 0 0-.59.61A2.99 2.99 0 0 1 15.754 11H12v2h3.754a4.98 4.98 0 0 0 3.904-1.874A3 3 0 0 1 25 13h2a5.006 5.006 0 0 0-5-5"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="breakfast"
          viewBox="0 0 2048 2048"
        >
          <path
            fill="currentColor"
            d="M1408 592q-26 0-45-19t-19-45q0-51 19-98t56-83l79-80q38-38 38-91q0-26 19-45t45-19q26 0 45 19t19 45q0 51-19 98t-56 83l-79 80q-38 38-38 91q0 26-19 45t-45 19m-384 0q-26 0-45-19t-19-45q0-51 19-98t56-83l79-80q38-38 38-91q0-26 19-45t45-19q26 0 45 19t19 45q0 51-19 98t-56 83l-79 80q-38 38-38 91q0 26-19 45t-45 19m832 176q40 0 75 15t61 41t41 61t15 75v384q0 40-15 75t-41 61t-61 41t-75 15h-57q-2 7-3 13t-4 12v39q0 66-25 124t-69 102t-102 69t-124 25h-384q-78 0-144-35t-110-93H334q-66 0-124-25t-102-68t-69-102t-25-125v-64h256q0-79 30-149t83-122t122-83t149-30q30 0 58 5t56 14V640h1024v128zM654 1152q-53 0-99 20t-82 55t-55 81t-20 100h370v-228q-26-13-54-20t-60-8m-320 512h441q-7-29-7-64v-64H153q10 28 28 51t41 41t52 26t60 10m463 67v1l1 2v-1zm867-131V768H896v832q0 40 15 75t41 61t61 41t75 15h384q40 0 75-15t61-41t41-61t15-75m256-256V960q0-26-19-45t-45-19h-64v512h64q26 0 45-19t19-45"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="snacks"
          viewBox="0 0 48 48"
        >
          <g
            fill="none"
            stroke="currentColor"
            stroke-linejoin="round"
            stroke-width="4"
          >
            <path d="M6 14h36V8h-4l-2-4H12l-2 4H6z" />
            <path stroke-linecap="round" d="m36 44l2-30H10l2 30z" />
          </g>
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="beverages"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M4 2h3.323l1.2 3H3v2h2.118l.827 14.059a1 1 0 0 0 .998.941h10.114a1 1 0 0 0 .998-.941L18.882 7H21V5H10.677l-2-5H4zm3.3 8.025L7.12 7h9.758l-.292 4.967c-2.307-.114-3.164-.475-4.216-.896c-1.092-.436-2.4-.936-5.072-1.046m.117 2.008c2.304.114 3.172.48 4.223.9c1.06.424 2.316.905 4.83 1.031L16.113 20H7.886z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="spices"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M14.178 9.766a9.981 9.981 0 0 0 4.827-2.622V4.003h-14v3.141a9.98 9.98 0 0 0 4.827 2.622a2.5 2.5 0 0 1 4.346 0m.208 2a2.501 2.501 0 0 1-4.762 0a11.941 11.941 0 0 1-4.62-2.015v10.252h14V9.75a11.942 11.942 0 0 1-4.618 2.016M4.005 2.004h16a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1h-16a1 1 0 0 1-1-1v-18a1 1 0 0 1 1-1"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="baby"
          viewBox="0 0 512 512"
        >
          <path
            fill="currentColor"
            d="M425.39 200.035A184.3 184.3 0 0 0 290.812 91.289l26.756-42.809l-27.136-16.96l-35.305 56.488A184.046 184.046 0 0 0 86.61 200.035a71.978 71.978 0 0 0 0 143.93a184.071 184.071 0 0 0 338.78 0a71.978 71.978 0 0 0 0-143.93m27.152 99.975a39.77 39.77 0 0 1-27.76 11.961l-20.725.394l-8.113 19.074a152.066 152.066 0 0 1-279.887 0l-8.114-19.074l-20.725-.394a39.978 39.978 0 0 1 0-79.942l20.725-.394l8.114-19.074a152.067 152.067 0 0 1 279.887 0l8.113 19.074l20.725.394a39.974 39.974 0 0 1 27.76 67.981"
          />
          <path
            fill="currentColor"
            d="M168 232h40v40h-40zm136 0h40v40h-40zm-48 152a80 80 0 0 0 80-80H176a80 80 0 0 0 80 80"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="health"
          viewBox="0 0 24 24"
        >
          <path
            fill="currentColor"
            d="M10.5 13H8v-3h2.5V7.5h3V10H16v3h-2.5v2.5h-3zM12 2L4 5v6.09c0 5.05 3.41 9.76 8 10.91c4.59-1.15 8-5.86 8-10.91V5zm6 9.09c0 4-2.55 7.7-6 8.83c-3.45-1.13-6-4.82-6-8.83v-4.7l6-2.25l6 2.25z"
          />
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="household"
          viewBox="0 0 14 14"
        >
          <g
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <path
              d="M12.36 6H1.64a1 1 0 0 0-1 1.13l.73 5.5a1 1 0 0 0 1 .87h9.24a1 1 0 0 0 1-.87l.73-5.5A1.001 1.001 0 0 0 12.36 6M4.5 8.5V11M7 8.5V11m2.5-2.5V11"
            />
            <path
              d="M9.48 1.54A2.79 2.79 0 0 1 11.78 4L12 6M2 6l.22-2a2.79 2.79 0 0 1 2.3-2.44"
            />
            <path
              d="M9.5 1.75A1.25 1.25 0 0 1 8.25 3h-2.5a1.25 1.25 0 0 1 0-2.5h2.5A1.25 1.25 0 0 1 9.5 1.75"
            />
          </g>
        </symbol>
        <symbol
          xmlns="http://www.w3.org/2000/svg"
          id="personal"
          viewBox="0 0 24 24"
        >
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="1.5"
            d="M22.012 14.74a3.504 3.504 0 0 1-7.008 0c0-2.628 3.5-7.009 3.5-7.009s3.508 4.381 3.508 7.009M9.998 9.233H3.99a2.002 2.002 0 0 0-2.002 2.002v10.013c0 1.106.896 2.002 2.002 2.002h6.008A2.002 2.002 0 0 0 12 21.248V11.235a2.002 2.002 0 0 0-2.002-2.002M4.766 6.23h4.456a.776.776 0 0 1 .778.775v2.228H3.99V7.005a.776.776 0 0 1 .776-.775M14 2.752l-.447-.895A2 2 0 0 0 11.764.75H2.989m4.005 13.489v4.005m-2.002-2.002h4.004M6.994.75v5.48"
          />
        </symbol>
        <symbol xmlns="http://www.w3.org/2000/svg" id="pet" viewBox="0 0 14 14">
          <path
            fill="none"
            stroke="currentColor"
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M1.5 9.5c.552 0 1-.672 1-1.5s-.448-1.5-1-1.5s-1 .672-1 1.5s.448 1.5 1 1.5m3-4.5c.552 0 1-.672 1-1.5S5.052 2 4.5 2s-1 .672-1 1.5s.448 1.5 1 1.5m5 0c.552 0 1-.672 1-1.5S10.052 2 9.5 2s-1 .672-1 1.5s.448 1.5 1 1.5m3 4.5c.552 0 1-.672 1-1.5s-.448-1.5-1-1.5s-1 .672-1 1.5s.448 1.5 1 1.5M10 10c0 1.38-1.62 2-3 2s-3-.62-3-2s1-3.5 3-3.5s3 2.12 3 3.5"
          />
        </symbol>
      </defs>
    </svg>

    <div class="preloader-wrapper">
      <div class="preloader"></div>
    </div>

    <div
      class="offcanvas offcanvas-end"
      data-bs-scroll="true"
      tabindex="-1"
      id="offcanvasCart"
    >
      <div class="offcanvas-header justify-content-center">
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="offcanvas"
          aria-label="Close"
        ></button>
      </div>
      <div class="offcanvas-body">
        <div class="order-md-last">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-primary">Your cart</span>
            <span class="badge bg-primary rounded-pill">3</span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-sm">
              <div>
                <h6 class="my-0">Growers cider</h6>
                <small class="text-body-secondary">Brief description</small>
              </div>
              <span class="text-body-secondary">$12</span>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-sm">
              <div>
                <h6 class="my-0">Fresh grapes</h6>
                <small class="text-body-secondary">Brief description</small>
              </div>
              <span class="text-body-secondary">$8</span>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-sm">
              <div>
                <h6 class="my-0">Heinz tomato ketchup</h6>
                <small class="text-body-secondary">Brief description</small>
              </div>
              <span class="text-body-secondary">$5</span>
            </li>
            <li class="list-group-item d-flex justify-content-between">
              <span>Total (USD)</span>
              <strong>$20</strong>
            </li>
          </ul>

          <button class="w-100 btn btn-primary btn-lg" type="submit">
            Continue to checkout
          </button>
        </div>
      </div>
    </div>

    <header>
      <div class="container-fluid">
        <div class="row py-3 border-bottom">
          

       

          <div
            class="col-sm-8 col-lg-2 d-flex gap-5 align-items-center justify-content-center justify-content-sm-end"
          >
            <ul class="d-flex justify-content-end list-unstyled m-0">
              <li>
                <a href="#" class="p-2 mx-1">
                  <svg width="24" height="24">
                    <use xlink:href="#user"></use>
                  </svg>
                </a>
              </li>
              <li>
                <a href="#" class="p-2 mx-1">
                  <svg width="24" height="24">
                    <use xlink:href="#wishlist"></use>
                  </svg>
                </a>
              </li>
              <li>
                <a
                  href="#"
                  class="p-2 mx-1"
                  data-bs-toggle="offcanvas"
                  data-bs-target="#offcanvasCart"
                  aria-controls="offcanvasCart"
                >
                  <svg width="24" height="24">
                    <use xlink:href="#shopping-bag"></use>
                  </svg>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>

    <section
      style="
        background-image: url('images/banner-1.jpg');
        background-repeat: no-repeat;
        background-size: cover;
      "
    >
      <!-- <div class="container-lg">
        <div class="row">
          <div class="col-lg-6 pt-5 mt-5">
            <h2 class="display-1 ls-1">
              <span class="fw-bold text-primary">Organic</span> Foods at your
              <span class="fw-bold">Doorsteps</span>
            </h2>
            <p class="fs-4">Dignissim massa diam elementum.</p>
            <div class="d-flex gap-3">
              <a
                href="#"
                class="btn btn-primary text-uppercase fs-6 rounded-pill px-4 py-3 mt-3"
                >Start Shopping</a
              >
              <a
                href="#"
                class="btn btn-dark text-uppercase fs-6 rounded-pill px-4 py-3 mt-3"
                >Join Now</a
              >
            </div>
            <div class="row my-5">
              <div class="col">
                <div class="row text-dark">
                  <div class="col-auto">
                    <p class="fs-1 fw-bold lh-sm mb-0">14k+</p>
                  </div>
                  <div class="col">
                    <p class="text-uppercase lh-sm mb-0">Product Varieties</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="row text-dark">
                  <div class="col-auto">
                    <p class="fs-1 fw-bold lh-sm mb-0">50k+</p>
                  </div>
                  <div class="col">
                    <p class="text-uppercase lh-sm mb-0">Happy Customers</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="row text-dark">
                  <div class="col-auto">
                    <p class="fs-1 fw-bold lh-sm mb-0">10+</p>
                  </div>
                  <div class="col">
                    <p class="text-uppercase lh-sm mb-0">Store Locations</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div
          class="row row-cols-1 row-cols-sm-3 row-cols-lg-3 g-0 justify-content-center"
        >
          <div class="col">
            <div class="card border-0 bg-primary rounded-0 p-4 text-light">
              <div class="row">
                <div class="col-md-3 text-center">
                  <svg width="60" height="60">
                    <use xlink:href="#fresh"></use>
                  </svg>
                </div>
                <div class="col-md-9">
                  <div class="card-body p-0">
                    <h5 class="text-light">Fresh from farm</h5>
                    <p class="card-text">
                      Lorem ipsum dolor sit amet, consectetur adipi elit.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card border-0 bg-secondary rounded-0 p-4 text-light">
              <div class="row">
                <div class="col-md-3 text-center">
                  <svg width="60" height="60">
                    <use xlink:href="#organic"></use>
                  </svg>
                </div>
                <div class="col-md-9">
                  <div class="card-body p-0">
                    <h5 class="text-light">100% Organic</h5>
                    <p class="card-text">
                      Lorem ipsum dolor sit amet, consectetur adipi elit.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card border-0 bg-danger rounded-0 p-4 text-light">
              <div class="row">
                <div class="col-md-3 text-center">
                  <svg width="60" height="60">
                    <use xlink:href="#delivery"></use>
                  </svg>
                </div>
                <div class="col-md-9">
                  <div class="card-body p-0">
                    <h5 class="text-light">Free delivery</h5>
                    <p class="card-text">
                      Lorem ipsum dolor sit amet, consectetur adipi elit.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> -->
    </section>

    
    
    

    <section class="pb-5">
      <div class="container-lg">
        <div class="row">
          <div class="col-md-12">
            <div
              class="section-header d-flex flex-wrap justify-content-between my-4"
            >
              <h2 class="section-title">사료/간식</h2>

              
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-md-12">
            <div
              class="product-grid row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-3 row-cols-xl-4 row-cols-xxl-5"
            >
              <div class="col">
                <div class="product-item">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img
                        src="${pageContext.request.contextPath}/resources/bootstrap/images/product-1.png"
                        alt="Product Thumbnail"
                        class="tab-image"
                      />
                    </a>
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">기무네데쓰까나리어카센터미널</h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-half"></use>
                        </svg>
                      </span>
                      <span>(222)</span>
                    </div>
                    <div
                      class="d-flex justify-content-center align-items-center gap-2"
                    >
                      <del>$24.00</del>
                      <span class="text-dark fw-semibold">$18.00</span>
                      
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3">
                          <input
                            type="number"
                            name="quantity"
                            class="form-control border-dark-subtle input-number quantity"
                            value="1"
                          />
                        </div>
                        <div class="col-7">
                          <a
                            href="#"
                            class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"
                            ><svg width="18" height="18">
                              <use xlink:href="#cart"></use>
                            </svg>
                            Add to Cart</a
                          >
                        </div>
                        <div class="col-2">
                          <a
                            href="#"
                            class="btn btn-outline-dark rounded-1 p-2 fs-6"
                            ><svg width="18" height="18">
                              <use xlink:href="#heart"></use></svg
                          ></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col">
                <div class="product-item">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img
                        src="${pageContext.request.contextPath}/resources/bootstrap/images/product-1.png"
                        alt="Product Thumbnail"
                        class="tab-image"
                      />
                    </a>
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">Whole Grain Oatmeal</h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-half"></use>
                        </svg>
                      </span>
                      <span>(41)</span>
                    </div>
                    <div
                      class="d-flex justify-content-center align-items-center gap-2"
                    >
                      <del>$54.00</del>
                      <span class="text-dark fw-semibold">$50.00</span>
                      
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3">
                          <input
                            type="number"
                            name="quantity"
                            class="form-control border-dark-subtle input-number quantity"
                            value="1"
                          />
                        </div>
                        <div class="col-7">
                          <a
                            href="#"
                            class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"
                            ><svg width="18" height="18">
                              <use xlink:href="#cart"></use>
                            </svg>
                            Add to Cart</a
                          >
                        </div>
                        <div class="col-2">
                          <a
                            href="#"
                            class="btn btn-outline-dark rounded-1 p-2 fs-6"
                            ><svg width="18" height="18">
                              <use xlink:href="#heart"></use></svg
                          ></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col">
                <div class="product-item">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img
                        src="${pageContext.request.contextPath}/resources/bootstrap/images/product-1.png"
                        alt="Product Thumbnail"
                        class="tab-image"
                      />
                    </a>
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">Sharp Cheddar Cheese Block</h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-half"></use>
                        </svg>
                      </span>
                      <span>(32)</span>
                    </div>
                    <div
                      class="d-flex justify-content-center align-items-center gap-2"
                    >
                      <del>$14.00</del>
                      <span class="text-dark fw-semibold">$12.00</span>
                     
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3">
                          <input
                            type="number"
                            name="quantity"
                            class="form-control border-dark-subtle input-number quantity"
                            value="1"
                          />
                        </div>
                        <div class="col-7">
                          <a
                            href="#"
                            class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"
                            ><svg width="18" height="18">
                              <use xlink:href="#cart"></use>
                            </svg>
                            Add to Cart</a
                          >
                        </div>
                        <div class="col-2">
                          <a
                            href="#"
                            class="btn btn-outline-dark rounded-1 p-2 fs-6"
                            ><svg width="18" height="18">
                              <use xlink:href="#heart"></use></svg
                          ></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col">
                <div class="product-item">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img
                        src="${pageContext.request.contextPath}/resources/bootstrap/images/product-1.png"
                        alt="Product Thumbnail"
                        class="tab-image"
                      />
                    </a>
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">Organic Baby Spinach</h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-half"></use>
                        </svg>
                      </span>
                      <span>(222)</span>
                    </div>
                    <div
                      class="d-flex justify-content-center align-items-center gap-2"
                    >
                      <del>$24.00</del>
                      <span class="text-dark fw-semibold">$18.00</span>
                      
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3">
                          <input
                            type="number"
                            name="quantity"
                            class="form-control border-dark-subtle input-number quantity"
                            value="1"
                          />
                        </div>
                        <div class="col-7">
                          <a
                            href="#"
                            class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"
                            ><svg width="18" height="18">
                              <use xlink:href="#cart"></use>
                            </svg>
                            Add to Cart</a
                          >
                        </div>
                        <div class="col-2">
                          <a
                            href="#"
                            class="btn btn-outline-dark rounded-1 p-2 fs-6"
                            ><svg width="18" height="18">
                              <use xlink:href="#heart"></use></svg
                          ></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col">
                <div class="product-item">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img
                        src="${pageContext.request.contextPath}/resources/bootstrap/images/product-1.png"
                        alt="Product Thumbnail"
                        class="tab-image"
                      />
                    </a>
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">
                      Organic Spinach Leaves (Fresh Produce)
                    </h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-half"></use>
                        </svg>
                      </span>
                      <span>(222)</span>
                    </div>
                    <div
                      class="d-flex justify-content-center align-items-center gap-2"
                    >
                      <del>$24.00</del>
                      <span class="text-dark fw-semibold">$18.00</span>
                      
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3">
                          <input
                            type="number"
                            name="quantity"
                            class="form-control border-dark-subtle input-number quantity"
                            value="1"
                          />
                        </div>
                        <div class="col-7">
                          <a
                            href="#"
                            class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"
                            ><svg width="18" height="18">
                              <use xlink:href="#cart"></use>
                            </svg>
                            Add to Cart</a
                          >
                        </div>
                        <div class="col-2">
                          <a
                            href="#"
                            class="btn btn-outline-dark rounded-1 p-2 fs-6"
                            ><svg width="18" height="18">
                              <use xlink:href="#heart"></use></svg
                          ></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col">
                <div class="product-item">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img
                        src="${pageContext.request.contextPath}/resources/bootstrap/images/product-1.png"
                        alt="Product Thumbnail"
                        class="tab-image"
                      />
                    </a>
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">Fresh Salmon</h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-half"></use>
                        </svg>
                      </span>
                      <span>(222)</span>
                    </div>
                    <div
                      class="d-flex justify-content-center align-items-center gap-2"
                    >
                      <del>$24.00</del>
                      <span class="text-dark fw-semibold">$18.00</span>
                   
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3">
                          <input
                            type="number"
                            name="quantity"
                            class="form-control border-dark-subtle input-number quantity"
                            value="1"
                          />
                        </div>
                        <div class="col-7">
                          <a
                            href="#"
                            class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"
                            ><svg width="18" height="18">
                              <use xlink:href="#cart"></use>
                            </svg>
                            Add to Cart</a
                          >
                        </div>
                        <div class="col-2">
                          <a
                            href="#"
                            class="btn btn-outline-dark rounded-1 p-2 fs-6"
                            ><svg width="18" height="18">
                              <use xlink:href="#heart"></use></svg
                          ></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col">
                <div class="product-item">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img
                        src="${pageContext.request.contextPath}/resources/bootstrap/images/product-1.png"
                        alt="Product Thumbnail"
                        class="tab-image"
                      />
                    </a>
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">
                      Imported Italian Spaghetti Pasta
                    </h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-half"></use>
                        </svg>
                      </span>
                      <span>(222)</span>
                    </div>
                    <div
                      class="d-flex justify-content-center align-items-center gap-2"
                    >
                      <del>$24.00</del>
                      <span class="text-dark fw-semibold">$18.00</span>
                     
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3">
                          <input
                            type="number"
                            name="quantity"
                            class="form-control border-dark-subtle input-number quantity"
                            value="1"
                          />
                        </div>
                        <div class="col-7">
                          <a
                            href="#"
                            class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"
                            ><svg width="18" height="18">
                              <use xlink:href="#cart"></use>
                            </svg>
                            Add to Cart</a
                          >
                        </div>
                        <div class="col-2">
                          <a
                            href="#"
                            class="btn btn-outline-dark rounded-1 p-2 fs-6"
                            ><svg width="18" height="18">
                              <use xlink:href="#heart"></use></svg
                          ></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col">
                <div class="product-item">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img
                        src="${pageContext.request.contextPath}/resources/bootstrap/images/product-1.png"
                        alt="Product Thumbnail"
                        class="tab-image"
                      />
                    </a>
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">Granny Smith Apples</h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-half"></use>
                        </svg>
                      </span>
                      <span>(222)</span>
                    </div>
                    <div
                      class="d-flex justify-content-center align-items-center gap-2"
                    >
                      <del>$24.00</del>
                      <span class="text-dark fw-semibold">$18.00</span>
                     
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3">
                          <input
                            type="number"
                            name="quantity"
                            class="form-control border-dark-subtle input-number quantity"
                            value="1"
                          />
                        </div>
                        <div class="col-7">
                          <a
                            href="#"
                            class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"
                            ><svg width="18" height="18">
                              <use xlink:href="#cart"></use>
                            </svg>
                            Add to Cart</a
                          >
                        </div>
                        <div class="col-2">
                          <a
                            href="#"
                            class="btn btn-outline-dark rounded-1 p-2 fs-6"
                            ><svg width="18" height="18">
                              <use xlink:href="#heart"></use></svg
                          ></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col">
                <div class="product-item">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img
                        src="${pageContext.request.contextPath}/resources/bootstrap/images/product-1.png"
                        alt="Product Thumbnail"
                        class="tab-image"
                      />
                    </a>
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">Organic 2% Reduced Fat Milk</h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-half"></use>
                        </svg>
                      </span>
                      <span>(222)</span>
                    </div>
                    <div
                      class="d-flex justify-content-center align-items-center gap-2"
                    >
                      <del>$24.00</del>
                      <span class="text-dark fw-semibold">$18.00</span>
                      <span
                        class="badge border border-dark-subtle rounded-0 fw-normal px-1 fs-7 lh-1 text-body-tertiary"
                        >10% OFF</span
                      >
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3">
                          <input
                            type="number"
                            name="quantity"
                            class="form-control border-dark-subtle input-number quantity"
                            value="1"
                          />
                        </div>
                        <div class="col-7">
                          <a
                            href="#"
                            class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"
                            ><svg width="18" height="18">
                              <use xlink:href="#cart"></use>
                            </svg>
                            Add to Cart</a
                          >
                        </div>
                        <div class="col-2">
                          <a
                            href="#"
                            class="btn btn-outline-dark rounded-1 p-2 fs-6"
                            ><svg width="18" height="18">
                              <use xlink:href="#heart"></use></svg
                          ></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col">
                <div class="product-item">
                  <figure>
                    <a href="index.html" title="Product Title">
                      <img
                        src="${pageContext.request.contextPath}/resources/bootstrap/images/product-1.png"
                        alt="Product Thumbnail"
                        class="tab-image"
                      />
                    </a> 
                  </figure>
                  <div class="d-flex flex-column text-center">
                    <h3 class="fs-6 fw-normal">Greek Style Plain Yogurt</h3>
                    <div>
                      <span class="rating">
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-full"></use>
                        </svg>
                        <svg width="18" height="18" class="text-warning">
                          <use xlink:href="#star-half"></use>
                        </svg>
                      </span>
                      <span>(222)</span>
                    </div>
                    <div
                      class="d-flex justify-content-center align-items-center gap-2"
                    >
                      <del>$24.00</del>
                      <span class="text-dark fw-semibold">$18.00</span>
                      <span
                        class="badge border border-dark-subtle rounded-0 fw-normal px-1 fs-7 lh-1 text-body-tertiary"
                        >10% OFF</span
                      >
                    </div>
                    <div class="button-area p-3 pt-0">
                      <div class="row g-1 mt-2">
                        <div class="col-3">
                          <input
                            type="number"
                            name="quantity"
                            class="form-control border-dark-subtle input-number quantity"
                            value="1"
                          />
                        </div>
                        <div class="col-7">
                          <a
                            href="#"
                            class="btn btn-primary rounded-1 p-2 fs-7 btn-cart"
                            ><svg width="18" height="18">
                              <use xlink:href="#cart"></use>
                            </svg>
                            Add to Cart</a
                          >
                        </div>
                        <div class="col-2">
                          <a
                            href="#"
                            class="btn btn-outline-dark rounded-1 p-2 fs-6"
                            ><svg width="18" height="18">
                              <use xlink:href="#heart"></use></svg
                          ></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- / product-grid -->
          </div>
        </div>
      </div>
    </section>

	<div class="paging">
	   <c:if test="${pageListNUM>1}">
			<a href="list?pageListNUM=${pageListNUM-1}&pageNUM=${pageListNUM*10-10}"> 이전 </a>
		</c:if>
	
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href="list?pageListNUM=${pageListNUM }&pageNUM=${i }"> ${i } </a>
		</c:forEach>
	
		<c:if test="${pageListNUM<(totalPage/10)}">
			<a href="list?pageListNUM=${pageListNUM+1}&pageNUM=${pageListNUM*10+1}"> 다음 </a>
		</c:if>
	</div>



   
 
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
      crossorigin="anonymous"
    ></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/script.js"></script>
  </body>
</html>