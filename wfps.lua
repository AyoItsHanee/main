while task.wait() do
    game:GetService("ReplicatedStorage"):WaitForChild("spins_thing_remote"):InvokeServer()
end
