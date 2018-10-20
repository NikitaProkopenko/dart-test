'use strict';

// Задание:
//     Написать алгоритм выдачи денег банкоматом и покрыть его юнит-тестами.
//     Номиналы купюр задаются в параметрах алгоритма, например: 1, 5, 10, 50.
//     Банкомат обладает неограниченным запасом денег.
//     Банкомат выдает запрашиваемую сумму минимальным количеством купюр, но количество номиналов купюр должно быть максимальным.
//     При запросе суммы в 20, банкомат выдаст пять купюр по 1, одну купюру по 5, и одну купюру 10.

let rating = [1, 5, 10, 20]; // Номиналы

let startRating = rating.slice(); // Копирую массив номиналов
let sum = 35;
let cashArray = [];

rating.sort((a, b) => a - b);

while (sum > 0) {
    for (let i = rating.length - 1; i >= 0; i--) {
        console.log('Остаток от деления ' + sum + ' на ' + rating[i] + ' равен ' + (sum % rating[i]));

        // Проход, чтобы собрать все номиналы, включая 1
        if ((sum % rating[i] > 0) && (sum % rating[i] !== sum) || (rating[i] === 1)) {
            cashArray.push(rating[i]);

            console.log(cashArray);

            // Уменьшаю сумму относительно выданных банкнот
            sum = sum - rating[i];
        }
    }
}

cashArray.sort((a, b) => a - b);

console.log(cashArray); // Собран массив из всех выданных банкнот

catchArrayElementsDuplication(cashArray);

//  Функция сбора повторений в массиве
//  input - массив номиналов

function catchArrayElementsDuplication(input) {
    let result = '';
    let count = 1;
    let totalCount = 0;

    for (let i = 0; i < input.length; i++) {
        let current = input[i];
        let next = input[i + 1];

        if (current === next) {
            count++;
            continue;
        }

        result += current;

        if (count >= 1) {
            result += ' - ' + (count + 'шт;');
            totalCount += count;
            count = 1;
        }
    }

    console.log(result);
    console.log(totalCount);
    return result;
}