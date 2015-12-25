QUnit.test "show session-dialog", (assert) ->
  dripcap.package.load('session-dialog').then (pkg) ->
    dripcap.action.emit 'core:new-session'
    wait assert, -> $('[riot-tag=session-dialog] .modal').is(':visible')

QUnit.test "interface list", (assert) ->
  list = $('[riot-tag=session-dialog] [name=interface] > option').map -> $(@).text()
  assert.deepEqual list.get(), [ 'eth0', 'nflog', 'nfqueue', 'any', 'lo' ], 'okay'

QUnit.test "cancel dialog", (assert) ->
  $('[riot-tag=session-dialog] .modal')[0].click()
  assert.ok !$('[riot-tag=session-dialog] .modal').is(':visible')
