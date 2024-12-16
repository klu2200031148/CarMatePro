<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CarMatePro</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .navbar {
            width: 98%;
            height: 75px;
            background-color: #4a90e2;
            display: flex;
            align-items: center;
            padding: 0 20px;
        }
        .logo {
            color: #fff;
            font-size: 35px;
            font-family: Arial;
        }
        .menu {
            display: flex;
            margin-left: auto;
        }
        ul {
            display: flex;
        }
        ul li {
            list-style: none;
            margin-left: 30px;
        }
        ul li a {
            text-decoration: none;
            color: #fff;
            font-family: Arial;
            font-weight: bold;
            transition: 0.4s ease-in-out;
        }
        ul li a:hover {
            color: #d1ecf1;
        }
        .header {
            background-image: url('https://previews.123rf.com/images/yurolaitsalbert/yurolaitsalbert1908/yurolaitsalbert190801052/129360491-happy-family-with-children-sitting-in-a-family-car.jpg'); 
            background-size: cover;
            background-position: center;
            height: 480px; 
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }
        .header h1 {
            font-size: 40px;
            margin-bottom: 20px;
        }
        .search-bar {
            margin-top: 20px;
        }
        .search-bar select,
        .search-bar button {
            padding: 10px;
            margin: 0 5px;
            border-radius: 5px;
            border: none;
        }
        .search-bar button {
            background-color: #4a90e2;
            color: white;
            cursor: pointer;
        }
        .search-bar button:hover {
            background-color: #357ABD;
        }
        .content {
            padding: 40px 20px;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .brand-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }
        .brand-item {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            width: 200px;
            text-align: center;
            transition: box-shadow 0.3s ease;
        }
        .brand-item:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .brand-item img {
            width: 100px;
            height: 100px;
            object-fit: contain;
            margin-bottom: 10px;
        }
        .brand-item p {
            font-size: 20px;
            font-weight: bold;
            margin: 0;
            color: #4a90e2;
        }
        .latest-cars {
            margin-top: 50px;
            width: 100%;
            overflow-x: auto;
            white-space: nowrap;
        }
        .car-carousel {
            display: flex;
            flex-wrap: nowrap;
        }
        .car-item {
            display: inline-block;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            margin: 0 10px;
            width: 300px;
            text-align: center;
            transition: box-shadow 0.3s ease;
        }
        .car-item:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .car-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            margin-bottom: 10px;
        }
        .car-item h3 {
            font-size: 20px;
            margin: 10px 0;
        }
        .car-item p {
            font-size: 16px;
            margin: 5px 0;
            color: #555;
        }
        .car-item .price {
            font-size: 18px;
            font-weight: bold;
            color: #4a90e2;
        }
        .car-item .view-offers {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 10px;
            background-color: #4a90e2;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .car-item .view-offers:hover {
            background-color: #357ABD;
        }
           .faq h2 {
        font-size: 24px;
        margin-bottom: 20px;
        text-align: center;
        color: #333;
    }
    .faq-item {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 10px;
        margin-bottom: 10px;
        padding: 20px;
        cursor: pointer;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }
    .faq-item:hover {
        background-color: #f4f4f4;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .faq-item h3 {
        font-size: 18px;
        margin: 0;
        color: #333;
    }
    .faq-item p {
        font-size: 16px;
        margin: 10px 0 0 0;
        display: none;
        color: #666;
    }
    .faq-item.active p {
        display: block;
    }
        .footer {
            background-color: #333;
            color: #f2f2f2;
            text-align: center;
            padding: 10px;
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
        }
        .footer p {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
        }
        .footer a {
            color: #4a90e2;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .footer a:hover {
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h2 class="logo">CarMatePro</h2>
        <div class="menu">
            <ul>
                <li><a href="FetchCompanies">HOME</a></li>
                <li><a href="Aboutus.html">ABOUT US</a></li>
                <li><a href="Reviews.html">REVIEWS</a></li>
                <li><a href="Contactus.jsp">CONTACT US</a></li>
                <li><a href="feedback.html">FEEDBACK</a></li>
                <li><a href="index.html">LOG OUT</a></li>
                
            </ul>
        </div>
    </div>
    
    <div class="header">
        <h1>Unlock the doors to your dream car. Start your journey with us and make it happen.</h1>
            </div>

    <div class="content">
        <h2>New cars in 2024</h2>
        <p>Welcome to CarMatePro! Your ultimate destination for premium car shopping. Explore a curated selection of top-quality vehicles, enjoy detailed insights, and make your purchase with confidence.

        CarMatePro brings a complete range of new cars in 2024 in India with prices.  stay tuned to the latest car news.</p>

        <h1>Search new cars by brand</h1>
        <div class="brand-grid">
            <c:forEach var="company" items="${companyList}">
                <div class="brand-item">
                    <a href="CompanyCars.jsp?company=${company.name}">
                        <img src="${company.image}" alt="${company.name} logo">
                        <p>${company.name}</p>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

        <h2>Latest Cars</h2>
        <div class="latest-cars">
            <div class="car-carousel">
                <div class="car-item">
                    <img src="https://stimg.cardekho.com/images/carexteriorimages/930x620/Maruti/Ignis/10323/1711970843574/front-left-side-47.jpg" alt="Car 1">
                    <h3>Maruti Ignis</h3>
                    <p>Maruti</p>
                    <div class="price">₹ 5.49 - 8.06 Lakh</div>
                    <a href="CarDetails.jsp?carname=Maruti%20Ignis&companyname=Maruti" class="view-offers">Know More</a>
                </div>
                <div class="car-item">
                    <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMSEhUSExMSFRUXFRcXFxgYGBYYEhcWFRUXFhcZGBUYHSogGBolGxgTITEhJSkrLi4uGB8zODMtOSgtLisBCgoKDg0OFQ8PGi0dFR0tKystLS0tLSsrKy0tLSstNy0tLS0rKysrKy0rLSsrKzctLS83LS0tLSsrNzc3LTI3Lf/AABEIAKgBKwMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABwIDBAUGAQj/xABJEAACAgEBBAYHAwcJBwUAAAABAgADEQQFEiExBhMiQVGBBzJCYXGRsRRSoSNDU4KSwdEVFkRicqKy0/Ezc8LD0uHwNDVjo6T/xAAYAQEBAQEBAAAAAAAAAAAAAAAAAQIDBf/EACIRAQEBAAIBAwUBAAAAAAAAAAABERIhAgQTMRRCUVJxA//aAAwDAQACEQMRAD8AnGIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICMzVbc29VpVy7DPIKMliTyAA4k8RwHEzkdqbWvt9bCD7vrH5A4BHce1w7hA7PV7boqGXtUDxzkfMcJh29KqAM9ojxGN355xIh6UbWurKrTZu2uUAbrGQnfbcwyVhVxyOTngG5YzOJ2vte8WGtL6mZAoNitYrkqDni7DeJxkkZ5jB7oR9EjplWRvIm8v3g6kfMZEvL0oB5UufgV/fIK9HvSV7LAlrbzjGXPrOhO6d895UlDvHjjInQ9N9jIrV3FAePVNw7iN+s+QFi+QmpJS1LSdIlPNCvxZZX/OCv8A0ZP4yCdPTV+jUeU2FGnQ+yv7ImuDHNM69Iavuv8A3D/xTIr2tWe5x+qT9MyH69mI3sqPgB/CZ1GygOWP2QZfbXmllNah7/mCPqJcS9TyZT8CJGunDg8OyPcf/DNrTaeRdyP7TfQkiT215O5ictpdSV9VyB4YXHyAmd/Kti4JQWr37nC0e8IThx44IPDgGzwzfGxdbuJjaHXV3Lv1sGGcHuII5qynirDvBAImTMqREQEREBERAREQEREBERAREQEREBERARE8Y44mB7OS6X9LRp92qrtWuCQfZRRzdvdxGBzYkYwMsNnfrTad0cK+897AcSfcv1kNbcfWXay+0UXFGdUU9S5IrrByBw4gv1hAx7XOWJWbbt09dkkuVwzljxZzncHuVRlsDvKHnkxtHpSAMEKpPADPaOfD34nMWaDaC7rJpdQzFt5gaLBxYfeIA4DA8hNdrtka6ywO+j1CEDGRS5yWbB5A4wm9xz3CLiNzsSm7XXvqEpttFe9gJ2UDsoCrvsQvZQvwz7Ymz0Ho81Aqy+mTrT2ixsozkneK43yDxJ7WQeUxuhmr12lU1nSap1YdYQC9BV3OWILAK/AqpU8RucO+dDZ0qsHBtJtdM961VW/IkHMLmo/fYV+g1VVuortStnK2OxBXdcbrAWIzAkKxIBOez7sybNds77RpSCAXZOOP0tZ3sD3b6sPORz0728mq0ZoQakWM6E9dS9fZXLEkqm73Dwne+jPan2nQr2gzrwYgjG+pK8/eULZx7cs6HK/yYq/cweI4jODxBHfgjj5zYts6vcBXnjiRyz4eUz9X0T1PX29UKTWX3lDOVYB8tgYU4AO8B7gJWvRTVD2ax8LGP0WdpZ+XPjWnpHHH+kyktwcTO/mzeO5P/t/y5bbYNo9qrzZh9VmtiZVNeql+u8GWl2DqDy6s/B8/ulf8g6kfm/kf+0nS9tpptUAuOGc/hM6sEAHl7u6aWrZepHHq/wC8n8ZsxprQOKMfNP8AqmbguW6cM3W1sarwAN9RneA5LYvKxOfA8Rk7pXOZsNnbdJYVahRVYfVIOarcDOa2+GcocMMHgRhjpxTaD6p/A/vl22tbF3LUJHA+0DkHIIYccg4PxAPdM3xaldeDE4gbffTMKmdnQnsMVbeXOOzY27gjwcE/18YLzP6P9KDfqDp3XDhWY4VlxukA88g8xOeNa6iIiRSIiAiIgIiICIiAiIgIiICIiBa1WoWtGsdlVFUszMQFVVGSSTyAE57U7UFvtBU5gE4JB5bynjn3HlMjptpVu0j6diQtpVGxzKbwZwPDKqwz75gUaZDzHyJH0gXV1NYGTYnHhzHGV0X0MucoeJHB1I4Eg8RKLdJUQV3FIIwQQCCPeDzhNLWBgKAPdyhWWb17t0/KUWWY49Xve5QD9eEtDSJ4S1fstHxxdcHOVZlPDuODxHuMDPrZSM9WPMDI+IxPLTX+jQ/qr/CWKdCqgAFsD+sSfMnnKzpf6xjRgX7Eov43Vo65yEYA1AjODuEYzxPGbTZ2hqpGKlVBw4LyGPAch5S0NMfvTz7M33hLqNkfH/t9J6HPj9P4TXJSw9rHwmQbgOBOT8zAzMn3QW/8/wBZYq1APfF2oVVLMQFAJJPIAcSTAqatDzVT8QM/jKerUchj4Ej6GaDT9K6rt7qQGUEjfsFyUndJDYtFLIcEEetzyOEXbccMFT7Ix+79rG9w54Vqwf3TSOiFuO9vnn6iVC8d/wBJzNnSGxSofTPlvVC26Ylu47oexC3MchKrekaL/tKdXX8aLHx8eqDYjB0uQfAylgPATmD0q0XtampP94eqPytCzZabXo4zXYrjnlWDj5gmMVsiF8BLK6asHeCqG5ZAAbHxHGaobcqPquH99YawcOfGsGWm29X/APIPjVcPqkuI34z3M3zla3OO/PlOcfb1YBJsRB4u24B7+2BLOk2jqt5eNFlRDZtVuJI4rhF4e4jPgc90mDrV1R8B9JU+tRQWY7oHMn1R8T3D3zk7ekIVtxrtOrfdZ1Dfsl8/hKH6SqQytdpuIIOWQcCMfek4q7ZHBAIIIPIjiD5yqRtsm10J+z3q3iEdbF81BInQ6PphUr9TqHqSwc8HAHHHbUn8nxI5nxPIHC+ODqIiJkIiICIiAiIgIiIHMdLL+2ieCk/tHA/wn5yI+k3pGur1TUaVailTbtjWZwzA9oKQRgA5GeJJBPKST051PV2M/wByjf8A2Osb90grots1XqstbDshR2Vl3t5HZw7HiMEFRxOfmZFTZ0c24NXQly8M5DLnJR14MpPfg8j3gg982otkaejO4VW3ULwSyqrVVrnJXP5O0ZPEgNhQTxwoJ4mSFvyjNW2XEumCrypbP3/WDGeLpULpgiyVCyBnC2erdMQPCNA82ttVNPS91rbqIpZj7h4DvJOAB3kiQBtvplr9fcRU9taZ7NdTlFAzw33BG83iSceAE770xagvXRpQ26Hc2Wf7uocM+4sw81HhOJ0VS7gIZdPp97c3yCbLGzjCrkGwg4ySwUccnPA1Gx6K9LtdorFXUWdfTntKbN+6scMsjNxOO9CSDy4c5Ni31314JFiOvdkqysMggjlkYIMgjpDXpNHd1L0XXEkkOdQFL9oqMBasDl7+Y4nnJT6EslStolaxjQEbD7pKpcCwQOoG9uuLV9VcYAxygY52LfoW39LX19WcFBui0Ix7QZR645kFeJ4dkEb0va3WaK5Q1lw09nIpqQ9bnA4Bi4G8RyDcyMZ4idWtmJ5drgPHygcjpU0FVbCy7Z7oO0Tv1ue/1kK5YEEjhx8OM5rb2mvLkbP1+jWr2FXVrXch4Ao4ZvZ7XIjPDIkj2PQ3rIh/tID9QZe36yAMpjkBw5eGJREum2ftwuq/aBYhYBmNmiuCqTxO67MTw7pk2UXafUVWbQWu2oMMVimhQzBLGDErzAK+GBgEjuMmW6Cg+tXUfiiH6ia3U9HtC4IOk03H2hVUrj3hguQY7EQdIemGqay5ntf8jq9zq1dkrNRFg3cLyx1WN4HPbPgMYtO1LBZ1ZvvYJqm0pJuty1dpcJYeON9SCQQMHABHDju+nvQa4G63Tr1i2lXb74dd7JUZ9reJ3fHGM8hyV6Mtru1Vyq2rpsG9WykInWb2c8vXX8YoztP0gv6tW61lZqLeOd4rZp+1vYbPF1GCOXaJHhNns3pTaLWG+wFtmmXIJBVdTWXUfk2Uv1bEjicnJ5Hnxy6xN1RniBqvD86m6n4za9G6DqL60rDEg6V+Az/6elmcfEtuqPEsPGQdB0s6T2G0JW9SKNPyrRWo6yuiu4snWDO4wYrjh49ozVDarlmUMoG8APydZOLaGtXu5qy7vvDceInvTvR2VXl7K7FVq2AJU43/ALPXRunwPYLfAgiaKi7LEoljcV9VCfUoasf3jA3lG3rF7YK9kBgAiDhZpTcybygOFyrJkMCVY5Mlfo/oygZn0en0ta7prLmvdccCWBsYt2VVm5DgV7xIX2Ts+y61KRVcu+URmZCAFFBqYj39pyPLnyk76Po5p+JC6dWbi+Kk3iW9bLDi3fzlmo7TY+qWyvskEKxXgcjHBlwfDdKzOnPbF6imwUU4yQd4KBujdxjIHBeHAAd06GSqRESBERAREQERECOvSzQRVa4J7WkuXHd2Ec59x7YkXdGdXSiCt1RLn07VjJ3UuSwBiC26cMr7rDI9nnzEnbpxsg6nSuq+uoZl9/YZGXzRmHhnHhIT0Gn3DpC14cXVV2JSUG7XwXt28T1ig4Cp3sePZUglY3Qy5qto0LYV3nrvRsH1d4teFPdzB4DxHfmS7VXvd8hTU6xU2vQykkC1FOeYZya7OOPvFjnvz5SWWdX5OAfjx/A5ikbj7Ge4wNI/uM1aV3r6trefH/EDLqa7VL9xh8P4FZFZ5oceyZScjmD8jLC7etHrUZ/slv8ApP1l1ektftJYvkp/fn8IR6Lh4zSdLNqOlSVUtu232pSjDmu83aYfBc+ZWdFXtnTv7XzRvrjE5XaWma7alDqo+z0VuwcFN1rXyMYBzkYr7vYMo5D0hXfaNpChWIColbHwCh77GHiQjHh3lJa29sOnW0C7QWca6wvVM3qKPZwQNznjfwAfa575xdDQ2p2lrV3iCw1YBALMub1UEKBk4UkfDMvXbGTSv11WuWuxU3V3q2RAck8X3/I5U8BylQq2RZrho2sU79d1KXgkbwVXWqxsd43FpZvAlvCbfoLde21rrnVlS1LFOT2d97WvVRx4sMPgDuz4GYuyiNQ6uQKlqsVmurAp072WKVbFnN0bcwMleOOI45y9hViu7SL9qpc1XspyR1jKfyYG5nK2EMA2eIwB3cIJTJnD9LOlh0mpSo1hxZwUA7rbwWvgCeByX78cp2jNIY9Mxzqqvg3+CiUSRsjaS6gEqHUggFXChhnkcqcAcCPLwIJy2EjPZG1Xs0/WV2mq7dZGYY4MMEkg9xwj48pz56a69GKtrQGUlSDUhIYHBHGn3Sial4cpeXU+6QnX6QdeOeorb40V/wDDWJdHpJ1wH9GPxrYcPJh35lEwtrD4n/zwlIIzyHyEiJfSXriM7mlP6r/5kof0ma0HPV6X9mz/ADI0dHs7W6zV321LqN3DWnBSrcCpqBUAB1fcGB4/dM9La2q5EGoZd4qOsWqrdU2FgoO7XzO6eHzxgkcLpeltiMzqhV2LlirEevZ1jAd+N7HyEDpfbviwKesX1W3jvDJPI54cWPznCzyer4f7emkm58fr3v8Acd3ptVrLuFmrtXGCpNSWBkZLXDoAuSD1TgYBJzwzymtfaGqFPWtqHUlkAXcrGVsRmDB1XHsnh9OGeTTpNdWd5F3CTnKswO9grnKtzwzD9Y+Ms19JX3SgCKuc7v5TdLAYzug4zjhmOPm39R6WW9Szr7Ym3YF7PpqXZiWatSx7yccScTJuuIEhenpfrlUJXeyqowqrRW2B3AMVyfMy5TtnaGo4G3WuDy6pAuTxzkpjdI4cOPPuneV5Hlltz4TX0TcjWVr95LW8lCg/i6yQ5CfoT2fbXrbGuS1GNFhAtbesKs9AGWwO9X4Y7/MzZM35QiIkCIiAiIgIiIAz5l1xr0WoZHJS/S2mk7zHD6dHzXuJ3lq93j5z6Q1eiFgwWsX+y7KfwMjrph6Ik1jdauosFmMbzkuSByBJOTiB89bR15e9rh2SXLj+qd7IHlwnWdDtu63WaunTb6HrHAZmReyg4u3DHJQT8cTe630G6xfUtrf5iasejraelya1wSMErnex4Z8P4QJn/mYc/k9WoHvry2f7S2AfhPT0Y1Y9W+tviXH4brSC/sO16z62pHwZ8fWejae1k/P6kY8Wb98ZF1OJ2JrV7qn+BH7wstNpNWvraY/qkH/CWkKr0w2wn9Kt8wP4S+vpN2unO7PxQGTDUp6jWIn+2qNZzjtgL8usAzL+m1FbDs8PhkD5rItp9M+019bqm+KY/fD+ly1jm3Q6FzjGTWN7HxxmMNeppgNrarTWYA1H2ioHuX7SOuqJz3+oPiYv6Oaere1ur7O8quunrIrUEqB27VzuqzBsBBk8d3ewcc/0g6UjV3petK6d1VR2GJUlCSjDPIjh8hOqt09W10V95uvVcWUhu0DntX0KeD54byHjhRxyATUV9FdtW2arQlmNNdl+KqaR1VFdW61dZZeIcvYtgG/knqic4MwujJq1L0rYppu04qtUAsQ2Sly3AEnLNkBx3h1YHKlWq6Q6jc2hpVqULXTdVYe0FGEZErC7xGQtNaHh32WeJmZtzYy0a37a7miitUVN3d6641ZrVK0PMNWteSRu4Yg54iBLDueU5Db3RSvWaoWajr+rQDdFRqDOSqBgS54Abg7uOeYxI01XTnVM7YdEB3iB2jgZ4KG3uOBwz7o0XSbaN9gqo3rbDnC1q7MQOZwG5e+BNFWhoWsUUaWqmrvyoe9uQy1pyQcDBIJblhhiV/yRTy6ik44ca0PL3kcZHmztgdIriB1RqGeL2uqqP1clvwM7V/RnrSBjapB3RkHT5G934PWjh8RLov29HtKfW0um86q8f4ZptZodlrlTp9GfEiusDyIAPmJ5rPRPtBx/7mjfGpl+jGa0+hLWt62up/Ycn6xo5LaXRSkMeo1umCk5Vbi6svfgsqsG+PCYX82PHW7N/bc/8md6voJv79enlSx/5kvD0DN37R//ADn/AD40RuejI79fs/yNn7qZSvRmsHJ2hovJdQfpVO/6Q+hG2nTtZptQ2otXj1bKEDr3hDk9rwB5yHbrXRirKVZSVZWBDBgcEEHiCD3Ro6d9iUDntGj9SnUn6rPF2Rpxw/lK39XT2/8AE4nO1a1Aynq98Dmrsd1uHjXusBnHIyjV6zfJKolSn2U3io83ZmPmYHW17J0THtanX2d+EqRR/etOJ2OyekFVSpp6NPcqDgqBWZ2zxJwo7RPEyL+jPR+/XXrTRUXY8+YRR9539hR4+QyeE+kOhHoy0mznW8b1uoCbu+2N1Sww5rUDs54jJJOCRniY3Bd6CaR+se56raxubq9YhRjvNvHCt2sDdXuxxnaREgREQEREBERAREQEREBERAtvQp5qD5CYl2x6G51r8pnxA0VvRPTN+bHyms1fo80j+wB5CdhECL9d6IKG9U4mh1foXPssJN0QPnDaPof1K+qMzSW9BtoUtvLW2QQQRkEEd4PcZ9VSkoPAQPmF9t7bqXc3tWAPgx8PWYE/jOZ151djF7UvdjwLPvM2ByG8cnE+wH0qHmqnyEsvsuk860+QgfGTaS0+w/7JlzTfaKiTX1qE8CV3lJHPGR3T7DfYWnP5pPkJjv0X0x/NJ8hA+T02vrl5X6ofrv8Axl5eke0Ry1Gq/aefU/8ANPS/ok+Qj+ael/RJ8hA+YK+mW015anUefH6iX09IO1B/SbflPpY9ENIfzKfIS23QvR/oU+QgfOlfpK2oP6Q/ymSvpN2r+mb5cJP38x9H+hT5CVL0J0f6FPkIEFU+lTaa82DfEEfSaXpD0p1GuJOo0+mZsACzcYXADkOsDAkDwORPpMdDdH+gr+QlxeiWjH5iv5CB8l07Lc+y3ym62XsEhgW07Wj7rFlU+dbBvxn1HT0e0y8qa/2RMpNnVDlWg8hAjTodtzUUIKqtm0VV94q3lJPLLFslj7ySZImi2izjLVsv4/umatKjkAPKV7sDxGzKoiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiIHkT2IHk9iICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiIH/9k=" alt="Car 2">
                    <h3>BMW 5 Series</h3>
                    <p>BMW</p>
                    <div class="price">₹ 72.90 Lakh</div>
                    <a href="CarDetails.jsp?carname=BMW%205%20Series&companyname=BMW" class="view-offers">Know More</a>
                </div>
               
                <div class="car-item">
                    <img src="data:image/jpeg;base64,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" alt="Car 4">
                    <h3>Audi Q5</h3>
                    <p>Audi</p>
                    <div class="price">₹Rs.65.51 - 72.30 Lakh</div>
                    <a href="CarDetails.jsp?carname=Audi%20Q5&companyname=Audi" class="view-offers">Know More</a>
                </div>
                <div class="car-item">
                    <img src="data:image/jpeg;base64,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" alt="Car 5">
                    <h3>Toyota Camry</h3>
                    <p>Toyota</p>
                    <div class="price">₹ 46.17 Lakh</div>
                    <a href="CarDetails.jsp?carname=Toyota%20Camry&companyname=Toyota" class="view-offers">Know More</a>
                </div>
                <div class="car-item">
                    <img src="data:image/jpeg;base64,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" alt="Car 6">
                    <h3>Hyundai Creta</h3>
                    <p>Hyundai</p>
                    <div class="price">₹ 10.00 - 17.54 Lakh</div>
                    <a href="CarDetails.jsp?carname=Hyundai%20Creta&companyname=Hyundai" class="view-offers">Know More</a>
                </div>
                <div class="car-item">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT13HKeoEyA2jBWLcU3fjXrW1oceujsn8uTzg&s" alt="Car 7">
                    <h3>Ford Mustang</h3>
                    <p>Ford</p>
                    <div class="price">₹ 80 Lakh</div>
                    <a href="CarDetails.jsp?carname=Ford%20Mustang&companyname=Ford" class="view-offers">Know More</a>
                </div>
            </div>
        </div>
    </div>
        <div class="faq">
    <h2>Frequently Asked Questions</h2>
    <div class="faq-item">
        <h3>What are the latest car models available in 2024?</h3>
        <p>The latest car models available in 2024 include Maruti Ignis, BMW 5 Series, Mini Cooper S, and many more. Prices start at Rs. 5.49 Lakh for Maruti Ignis and go up to Rs. 72.90 Lakh for BMW 5 Series.</p>
    </div>
    <div class="faq-item">
        <h3>How can I compare different car models?</h3>
        <p>To compare car models, consider factors such as price, performance, features, reliability, and resale value. Test drives and brochures from dealerships can also help in making a decision.</p>
    </div>
    <div class="faq-item">
        <h3>What are the best cars for a small family?</h3>
        <p>Some of the best cars for a small family include Wagon R, Tiago, Swift, Baleno, and i20. Prices start at Rs 5.54 Lakh in India.</p>
    </div>
    <div class="faq-item">
        <h3>Which cars are the best to buy in 2024?</h3>
        <p>Popular cars to buy in 2024 include Punch, Swift, Creta, Thar, and Scorpio. Prices start at Rs 6.13 Lakh.</p>
    </div>
    <div class="faq-item">
        <h3>What are the popular car companies in India?</h3>
        <p>Popular car manufacturers in India include Maruti, Tata, Kia, Toyota, and Hyundai. There are 42 car manufacturers in total in India.</p>
    </div>
 
    <script>
        document.querySelectorAll('.faq-item').forEach(item => {
            item.addEventListener('click', () => {
                item.querySelector('p').style.display = item.querySelector('p').style.display === 'none' ? 'block' : 'none';
            });
        });
    </script>
    <div class="footer">
        <p>&copy; 2024 CarMatePro. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>
</body>
</html>