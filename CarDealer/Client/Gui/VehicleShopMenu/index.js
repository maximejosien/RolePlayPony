new Vue({
    el: '#app',
    data: {
        message: 'Hello World',
        // urlVehicleImages: '../Images/Vehicles/',
        urlVehicleImages: 'http://asset/RolePlayPony/CarDealer/Client/Gui/Images/Vehicles/',
        vehicleTypes: [
            {
                name: 'Berline',
                vehicles: [
                    {id: 1, name: 'Sedan_01', price: 10000, imageUrl: 'Sedan_01.jpg'},
                    {id: 4, name: 'Sedan_02', price: 10000, imageUrl: 'Sedan_02.jpg'},
                    {id: 5, name: 'Sedan_03', price: 10000, imageUrl: 'Sedan_03.jpg'},
                    {id: 11, name: 'Coupe_01', price: 10000, imageUrl: 'Coupe_01.jpg'},
                    {id: 19, name: 'Sedan_OneColor', price: 10000, imageUrl: 'Sedan_OneColor.jpg'},
                    {id: 29, name: 'Sedan_06', price: 10000, imageUrl: 'Sedan_06.jpg'},
                ],
            },
            {
                name: 'Sportive',
                vehicles: [
                    {id: 6, name: 'Nascar_01', price: 10000, imageUrl: 'Nascar_01.jpg'},
                    {id: 12, name: 'Rally_01', price: 10000, imageUrl: 'Rally_01.jpg'},
                    {id: 37, name: 'SportsCar_01', price: 10000, imageUrl: 'SportsCar_01.png'},
                ],
            },
            {
                name: '4x4',
                vehicles: [
                    {id: 7, name: 'Truck_01', price: 10000, imageUrl: 'Truck_01.jpg'},
                    {id: 27, name: 'Truck_02', price: 10000, imageUrl: 'Truck_02.png'},
                ],
            },
            {
                name: 'Camion',
                vehicles: [
                    {id: 28, name: 'Lorry_01', price: 10000, imageUrl: 'Lorry_01.png'},
                ],
            },
        ],
        vehicleSelected: null,
        vehicleList: [],
    },
    methods: {
        vehicleTypeChange(event) {
            this.vehicleSelected = null
            this.vehicleTypes.forEach((vehicleType) => {
                if (vehicleType.name === event.target.value) {
                    this.vehicleList = vehicleType.vehicles
                }
            })
        },
        vehicleChange(event) {
            this.vehicleList.forEach((vehicle) => {
                if (vehicle.name === event.target.value) {
                    this.vehicleSelected = vehicle
                }
            })
        },
        buyVehicle() {
            ue.game.callevent("playerBuyVehicleAtCarDealer", JSON.stringify([
                this.vehicleSelected.id,
            ]));
        }
    },
    computed: {
        isVehicleTypeSelected() {
            return this.vehicleList.length !== 0
        },
        isVehicleSelected() {
            return this.vehicleSelected !== null
        },
        createSelectMenu() {
            return 'HELLO'
        },
        getVehicleSelect: {
            get() {
                return this.vehicleSelected === null ? 'Type de vehicule' : this.vehicleSelected.name
            },
            set(value) {
            }
        }
    }
});