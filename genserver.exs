defmodule ShoppingList do
  use GenServer

  ######Client######

  #start GenServer list

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end


  #Add new items to list

  def add(pid, item) do
    GenServer.cast(pid, item)
  end

  #View the list

  def view(pid) do
    GenServer.call(pid, :view)
  end


  #Remove items

  def remove(pid, item) do
    GenServer.cast(pid, {:remove, item})
  end

  #Poweroff process

  def stop(pid) do
    GenServer.stop(pid)

  end


  ######Server######

  #Start process

  def init(list) do
    {:ok, list}
  end


  #Add new items

  def handle_cast(item, list) do
    updated_list = [item|list]
    {:noreply, updated_list}
  end


  #View list


  def handle_call(:view, _from, list) do
    {:reply, list, list}
  end

  #Remove items


  def handle_cast({:remove, item}, list) do
    updated_list = Enum.reject(list, fn(i) -> i == item end)
    {:noreply, updated_list}
  end


  #Shutdown process


  def terminate(_reason, list) do
    IO.puts("Process killed")
    IO.inspect(list)
    :ok
  end

end



# ReadMe
# Start Process - {:ok, pid} = ShoppingList.start_link()
# Check process - Process.alive?(pid)
# Add new items - ShoppingList.add(pid, "item-name")
# Delete items - ShoppingList.remove(pid, "item-name")
# Check List - ShoppingList(pid)
# Shutdown -  ShoppingList.stop(pid)
