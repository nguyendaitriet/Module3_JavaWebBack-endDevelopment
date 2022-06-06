class TransferInfo {
    constructor(id, senderId, senderName, recipientId, recipientName,
        fee, feeAmount, transferAmount) {
        this.id = id;
        this.senderId = senderId;
        this.senderName = senderName;
        this.recipientId = recipientId;
        this.recipientName = recipientName;
        this.fee = fee;
        this.feeAmount = feeAmount;
        this.transferAmount = transferAmount;
    }
}

var allTransferInfo = [];

const transferInfoData = "transferInfoData";

function init() {
    if (getLocalStorage(transferInfoData) == null) {
        allTransferInfo = [
            new TransferInfo(1, 10, "Nguyen Nam Anh", 3, "Phan Hong Nhung", 10, 30000, 30000000),
            new TransferInfo(2, 3, "Phan Hong Nhung", 9, "Dinh The Hai", 10, 90000, 9000000),
            new TransferInfo(3, 9, "Dinh The Hai", 10, "Nguyen Nam Anh", 10, 780000, 78900000),
        ]
        setLocalStorage(transferInfoData, allTransferInfo);
        return;
    }
    allTransferInfo = getLocalStorage(transferInfoData);
}

function setLocalStorage(key, data) {
    localStorage.setItem(key, JSON.stringify(data))
}

function getLocalStorage(key) {
    return JSON.parse(localStorage.getItem(key))
}

function renderTransferInfo() {
    let htmls = allTransferInfo.map(function (transferInfo) {
        return `
        <tr>
            <td>
                <input type="checkbox">
            </td>
            <td class="align-center">${transferInfo.id}</td>
            <td class="align-center">${transferInfo.senderId}</td>
            <td>${transferInfo.senderName}</td>
            <td class="align-center">${transferInfo.recipientId}</td>
            <td>${transferInfo.recipientName}</td>
            <td class="align-right">${transferInfo.fee}</td>
            <td class="align-right">${transferInfo.feeAmount}</td>
            <td class="align-right">${transferInfo.transferAmount}</td>
        </tr>`
    })
    document.querySelector("#tbTransfer>tbody").innerHTML = htmls.join("")
}

(function () {
    init();
    renderTransferInfo();
})()

