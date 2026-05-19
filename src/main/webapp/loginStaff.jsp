<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <!-- Include Tailwind CSS CDN or local file here -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <style>
            body {
                background: linear-gradient(-45deg, #60A5FA, #34D399, #23a6d5, #6495ED);
                background-size: 400% 400%;
                animation: gradient 15s ease infinite;
                height: 100vh;
            }

            @keyframes gradient {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }
        </style>
    </head>
    <body class="gradient-bg-animate">
        <div class="font-sans">
            <div class="relative min-h-screen flex flex-col sm:justify-center items-center">
                <div class="relative sm:max-w-sm w-full">
                    <div class="card bg-blue-400 shadow-lg w-full h-full rounded-3xl absolute transform -rotate-6"></div>
                    <div class="card bg-green-400 shadow-lg w-full h-full rounded-3xl absolute transform rotate-6"></div>
                    <div class="relative w-full rounded-3xl px-6 py-4 bg-gray-100 shadow-md">
                        <h2 class="block mt-3 text-sm text-gray-700 text-center font-semibold">
                            Đăng Nhập
                        </h2>
                        <form method="post" action="loginHandler.jsp" class="mt-10">
                            <div>
                                <label for="email" class="block text-sm text-gray-600"></label>
                                <input id="email" type="email" name="email" placeholder="Tên Tài Khoản" required
                                       class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                            </div>
                            <div class="mt-7">
                                <label for="password" class="block text-sm text-gray-600"></label>
                                <input id="password" type="password" name="password" placeholder="Mật Khẩu" required
                                       class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                            </div>
                            <div class="mt-7 flex items-center">
                                <label for="remember_me" class="inline-flex items-center cursor-pointer">
                                    <input id="remember_me" type="checkbox" name="remember"
                                           class="rounded border-gray-300 text-indigo-600 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                                    <span class="ml-2 text-sm text-gray-600">Ghi Nhớ Đăng Nhập</span>
                                </label>
                                <div class="ml-auto">
                                    <a href="#" class="underline text-sm text-gray-600 hover:text-gray-900">Quên Mật Khẩu?</a>
                                </div>
                            </div>
                            <div class="mt-7">
                                <button type="submit"
                                        class="bg-blue-500 w-full py-3 rounded-xl text-white shadow-xl hover:shadow-inner focus:outline-none transition duration-500 ease-in-out transform hover:-translate-x hover:scale-105">
                                    Đăng Nhập
                                </button>
                            </div>
                            <div class="flex mt-7 items-center text-center">
                                <hr class="border-gray-300 border-1 w-full rounded-md">
                                <span class="block font-medium text-sm text-gray-600 w-full">Hoặc Đăng Nhập Với</span>
                                <hr class="border-gray-300 border-1 w-full rounded-md">
                            </div>
                            <div class="flex mt-7 justify-center w-full">
                                <button type="button" class="mr-5 bg-blue-500 px-4 py-2 rounded-xl cursor-pointer text-white shadow-xl hover:shadow-inner transition duration-500 ease-in-out transform hover:-translate-x hover:scale-105">
                                    Facebook
                                </button>
                                <button type="button" class="bg-red-500 px-4 py-2 rounded-xl cursor-pointer text-white shadow-xl hover:shadow-inner transition duration-500 ease-in-out transform hover:-translate-x hover:scale-105">
                                    Google
                                </button>
                            </div>
                            <div class="mt-7 text-center">
                                <p class="flex justify-center items-center">
                                    <span class="mr-2">Nếu Bạn Chưa Có Tài Khoản</span>
                                    <a href="#" class="text-blue-500 transition duration-500 ease-in-out transform hover:-translate-x hover:scale-105">Tạo Tài Khoản Mới</a>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
