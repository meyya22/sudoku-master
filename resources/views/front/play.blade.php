@extends('theme.front')

@section('style')
@endsection

@section('content')
  @php
    $sudoku = json_decode($puzzle['l_display'], 1);
    $count = 0;
  @endphp
  <form method="POST" id="sudokuForm" action="javascript:;" >
    {{csrf_field()}}
    <input type="hidden" name="puzzle" value="{{$puzzle['id']}}">
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

                      $editable = intval($sudoku[$count]) > 0 ? true : false;
                    @endphp

                    <td class="{{implode(' ', $class)}}">
                      <div class=cell>
                        <input
                          name="block[{{$count}}]"
                          id="block{{$count}}"
                          class="cell"
                          valign="middle"
                          type="number"
                          min="1"
                          max="9"
                          @if($editable)
                            value="{{intval($sudoku[$count])}}"
                            readonly
                          @endif
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
            <button id="btnValidate" onclick="validateFn()" class="btn btn-primary validate">
              Validate
            </button>
            <button id="btnSolution" onclick="solutionFn()" class="btn btn-primary solution">
              Solution
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

    function validateFn() {
      jQuery.ajax({
        url: ajaxCallUrls.validate,
        data: $(formSel).serialize(),
        headers: {
          "X-CSRF-Token": $(formSel + ' [name="_token"]').val()
        },
        type: "POST",
        success: function(response) {
          if (response["success"] !== undefined) {
            if (response["success"]) {
              showNotification(true, messages.success.validate);
            } else {
              showNotification(false, messages.error.validate);
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

    function solutionFn() {
      jQuery.ajax({
        url: ajaxCallUrls.solution,
        data: $(formSel).serialize(),
        headers: {
          "X-CSRF-Token": $(formSel + ' [name="_token"]').val()
        },
        type: "POST",
        success: function(response) {
          if (response["success"] !== undefined && response["success"]) {
            setGridValues(response);
          }
        },
        error: function(error) {
          showNotification(false, messages.error.somethingWentWrong);
        }
      });
    }

  </script>
@endsection