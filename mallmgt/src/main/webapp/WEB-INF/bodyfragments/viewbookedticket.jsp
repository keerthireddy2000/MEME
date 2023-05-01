<style>



.bg-blue {
  background: blue;
}

.dotted-line {
  border: 1px dashed #fff;
}

.img-fluid {
  width: 114px;
  height: auto;
}

.bg-top {
  background: black;
}

</style>

<div class="container mt-5 mb-5">
        <div class="d-flex justify-content-center row">
            <div class="col-md-6">
                <div class="card border-0">
                    <div class="card-body d-flex flex-column justify-content-between text-white p-0">
                        <div class="p-4 bg-top">
                            <div class="d-flex flex-row justify-content-between">
                                <div class="d-flex flex-column justify-content-between align-items-center">
                                    <h1>Movie Name: ${ticket.title}</h1><span class="mb-2">Date & Time</span><span>${ticket.dateString}</span><span>${ticket.showTime}</span></div>
                         
                            </div>
                        </div>
                        <div class="bg-danger p-4">
                            <div class="d-flex flex-column justify-content-between">

                                <div class="d-flex flex-row justify-content-between">
                                    <div class="d-flex flex-column">
                                        <div><span class="d-block font-weight-bold">Booked by</span><span>${ticket.firstName}</span></div>
                                        
                                    </div>
                                    <div><span class="d-block font-weight-bold">Seats Numbers</span><span>${ticket.seatNumbers}</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>