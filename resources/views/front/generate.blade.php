@extends('theme.front')

@section('style')
@endsection

@section('content')
  @php
    $count = 0;
  @endphp
  <form method="POST" id="sudokuForm" action="javascript:;" >
    {{csrf_field()}}
    <div id=sudoku>
      <table>
        <tr>
          <td>
            <table class="sudoku_table" cellspacing="0" cellpadding="1" bgcolor="#000000">
              @for ($x = 0; $x < 9; $x++)
                <tr>
                  @for ($y = 0; $y < 9; $y++)

                    @php
                      $class = [];
                      if( in_array($x, [2,5]) ) {
                        $class[] = "sudoku-border-bottom";
                      }
                      if( in_array($y, [2,5]) ) {
                        $class[] = "sudoku-border-right";
                      }
                    @endphp

                    <td class="{{implode(' ', $class)}}">
                      <div class=cell>
                        <input
                          name="block[{{$x}}][{{$y}}]"
                          id="block{{$count}}"
                          class="cell"
                          valign="middle"
                          type="number"
                          min="1"
                          max="9"
                          value=""
                        >
                        @php
                          $count++;
                        @endphp
                      </div>
                    </td>
                  @endfor
                </tr>
              @endfor
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <button type="button" id="btnFeasible" onclick="feasibleFn()" class="btn btn-primary validate">
              Validate
            </button>
            <button type="button" id="btnSaveGrid" onclick="saveGridFn()" class="btn btn-primary solution">
              Save
            </button>
          </td>
        </tr>
        <tr>
          <td>
            <div id="notificationMessage"></div>
          </td>
        </tr>
      </table>
    </div>
  </form>
@endsection

@section('script')
  <script type="text/javascript">

    var formSel = "#sudokuForm";

    function feasibleFn() {
      jQuery.ajax({
        url: ajaxCallUrls.feasible,
        data: $(formSel).serialize(),
        headers: {
          "X-CSRF-Token": $(formSel + ' [name="_token"]').val()
        },
        type: "POST",
        success: function(response) {
          if (response["success"] !== undefined) {
            if (response["success"]) {
              showNotification(true, messages.success.feasible);
            } else {
              showNotification(false, messages.error.feasible);
            }
          } else {
            showNotification(false, messages.error.somethingWentWrong);
          }
        },
        error: function(error) {
          showNotification(false, messages.error.somethingWentWrong);
        }
      });
    }

    function saveGridFn() {
      jQuery.ajax({
        url: ajaxCallUrls.saveGrid,
        data: $(formSel).serialize(),
        headers: {
          "X-CSRF-Token": $(formSel + ' [name="_token"]').val()
        },
        type: "POST",
        success: function(response) {
          if (response["success"] !== undefined) {
            if (response["success"]) {
              showNotification(true, messages.success.saveGrid);
              setGridValues(response);
            } else {
              showNotification(false, messages.error.saveGrid);
            }
          } else {
            showNotification(false, messages.error.somethingWentWrong);
          }
        },
        error: function(error) {
          showNotification(false, messages.error.somethingWentWrong);
        }
      });
    }

  </script>
@endsection