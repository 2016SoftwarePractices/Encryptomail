require 'rubygems'
require 'gpgme'
load 'backend.rb'

class BackendUnitTests
	
	@VERBOSE = true
	
	#Verbose printing for debug output
	def self.vp (message)
		if(@VERBOSE)
			puts(message)
		end
	end
	
	
	#test PGP keypair generation
	def self.testGPGmekeygen()
		vp "TEST: Attempting to test the creation of a PGP key"
		vp "	Generating PGP key - this may take a while: "
		key_string = Backend.generatePGPkey(@name, @email, @passphrase)
		vp key_string
		vp "	successfully created a new keypair for #{@email}"
		return true
	end
	
	
	#test public key export
	def self.testpublickeyexport()
		vp "TEST: Attempting to export public key for #{@email}"
		Backend.exportpublickey(@email)
	end
	
	
	#test private key export
	def self.testprivatekeyexport()
		vp "TEST: Attempting to export private key for #{@email}"
		Backend.exportprivatekey(@email)
	end
	
	
	#test key listing
	def self.testkeylisting()
		Backend.listallpublickeys()
		Backend.listallprivatekeys()
	end
	
	
	def self.testkeydeletion()
		Backend.deletekey(@email)
		return true
	end
	
	
	#test encrypting simple message
	def self.testEncryptMailString()
		vp "TEST: Attempting to encrypt a message with PGP"
		@encryptedMessage = Backend.encryptMailString(@message, @email)
		vp "	successfully encrypted a message for #{@email}"
		return @encryptedMessage
	end
	
	
	#test decrypting simple message
	def self.testDecryptMailString()
		vp "TEST: Attempting to decrypt a message encrypted with PGP"
		decrypted = Backend.decryptMailString(@encryptedMessage, @passphrase)
		vp "	successfully decrypted the message"
		return decrypted
	end
	
	
	#Test email size function
	def self.testEmailSize()
		vp "TEST: Verifying email size"
		size = Backend.check_email_size(@email)
		return size
	end
	
	
	##TEST SET 1 PARAMS
	@name = "test_user1"
	@email = "test_user1@encryptomail.xyz"
	@passphrase = "hry785jB"
	
	##TEST SET 2 PARAMS
	@message = 
	"This is a message."
	
	@encryptedMessage = 
	" "
	
	@rawEmail_NoArmor = 
	"Return-Path: <pi@encryptomail.xyz>
	X-Original-To: test_user1@encryptomail.xyz
	Delivered-To: test_user1@encryptomail.xyz
	Received: by mail.encryptomail.xyz (Postfix, from userid 1001)
	        id A27401606A4; Mon,  4 Apr 2016 16:46:50 -0600 (MDT)
	Date: Mon, 04 Apr 2016 16:46:50 -0600
	To: test_user1@encryptomail.xyz
	Subject: THIS IS THE SUBJECT LINE
	User-Agent: mail v14.8.8
	Message-Id: <20160404224650.A27401606A4@mail.encryptomail.xyz>
	From: pi@encryptomail.xyz
	
	THIS IS THE BODY OF THE EMAIL MESSAGE.
	This text should become encrypted" + "\n."
	
	
	@test_pubkey = 
	"-----BEGIN PGP PUBLIC KEY BLOCK-----
	Version: Mailvelope v1.3.6
	Comment: https://www.mailvelope.com
	
	xsFNBFcCvH0BEADk2IuyZM68j9bDAsxCt4gS6HVPVH+MfUZHmA06iE2fDZYN
	wrRcVOtGgMiih/3W05hyljIfP7WfQbHdMyKM2NDx/VCQIwLfhQ3oZXoZKtfK
	76qWeF1Ux+QyW9wutRIAohqDzHrTlpUciHVilBo4/UD947RFiB+RHXKvmE4H
	beMGLHljMuaNZ10456k5ui5So+DzK2qMuieTP2mnqlidt8ikrr31T4x2QJij
	EqDRPN7JRiedB5xEMbiZ0dEV4XgLCF8wmkyfU/Ca0oraYY3ZTG5t7xqMc6wn
	mOQTxRzrtS94u5KnQvNRBWOS7j05i6tfN1fiScaEMjot0Cv1P4qEiDdWpVWb
	2GYr6IAtNaRRMEc5OqWBDX7nvrzO2fUKnqtqLw4D3B2MvMus/v83Z9MaJcUV
	Cvo1LFgThXi9qJB+F9XM3J4Lr1TGrQO16V3I4BxBSHrNPNQgczuZXVhIYcWG
	UnWX3s0jcnHvs5BwxhUQbln2diAprJOBP2VgSMvfRyggFdjcd2Hd/asmPGa4
	s7K7oQV0YGiVyCbE2GwVvqozv+vcghPSJDGDM5lUzT3CqrCHKeu6+hCw4LsG
	FYbZVQQCqvsujUEluQ/eABMopVGy+0ItekeKJJVYhvY50QMgd+Llxo339xRL
	7LtjXM0P80sqNqvRyo2b/0BXGfEklBmXUGhiWwARAQABzSlUZXN0IFVzZXIg
	MSA8dGVzdF91c2VyMUBlbmNyeXB0b21haWwueHl6PsLBdQQQAQgAKQUCVwK8
	fwYLCQgHAwIJEB0DzcawBL9rBBUIAgoDFgIBAhkBAhsDAh4BAABzyg//X/Zz
	KG+R+rmLOpqrYkQ6XN8reo8Wu3cg6veWfqCH1nWGeC3IBMYmUOTRkRU0NNsl
	OxD+yzP4iXkoyITwCxvUFH+qv4WA+3GSCNQO0dP/EMOqfgPG/HVLj9Dq3BAi
	M5zGPwx90ncVdFBO9ROQDhwQ8V1muIaVkehTuTqR4H8ksbvKGK8b2sto+08L
	wEeWIpnQwdPcaxFVwElFXeZ9HdssiktGjVVhk4r2eVdYIfQcoKXG3RlDhmRP
	sVKj6yb42XDeUzWio2ALHDhxDzjdMzqHPdw3ln6AefbV6kLPzSKiZZXvMxeq
	dUHFf17Ww82XkOEBuxF0rBnvPQPUxeE9fcbmFYIEbnKZmvwYJTZs/rUf10Zq
	tn5WRdyU4DuzP4mnUSVD+V1FbanctwUe142X8/zliOQcytDPWFAbjqWjES9M
	Sm73mD3ddd+pqo5n0Vtt4yKb6TaA3qfNPu9afA0R3rULKNyHV19B8IN5lCC4
	8mQtZAM3h40kcKFQd5n4lJIYwNuW1YxDZZWLA9sauWjIp7y6ICJDHOiTaRXw
	78OoOq2ZhJZ5/tKTZTJG9T5atjZj/eswrdPUNa/uQLNSbyiJtAjV7RHcS00e
	vdEX/vYcCzkMZo8atvSOEIGibQqILJPcKJ8ZowWM5Qioln/gmKv2MfIU8biI
	pVsOMDidEoqtMkdZg1vOwU0EVwK8fQEQALXprkHpj3S5/zLPYV8+3JgGlD6f
	O/9W8QgIZZGWgelo4LaEUdr8XRa+gTReiQYf7rMoRI83uMDesO8nWQtpCIIL
	dRVePk3Bs9KL+mD4IAeQhNp3XRCoMAalVxx4jBVefFqL1ek0MXkICKIRomxK
	uHbl0E0htPc7LHKeftbromh09Dbo76/HeNFXJVWwfpbZobxaHvoyBMdnM2GQ
	xVal2wgbWm4njZ+DhCQxHlAKIv8PTc8oicAP75sm3OiQknHS5FjsatuCvR3V
	TBsCR9oPRgJ1aiYwbl7ucH5satsBkoVic5jXZrTxK0UmQg5sgvof3t2KmQi7
	h3QxV7zrMXxu3R+044IPUcq7oFYK4sWq5iepsEJfqnzQiwM+6In/h+lCqrMF
	NBhikkP4L/IHOUvRr7HwI3EwFRM/ehvBnzu+jiRCDc0/h5kKn2hDEwFC7stP
	OPF81WakrimKANBybX4GC9aS5yyJWcYhd6uDuBPBfBqC1h/XaIBvj/vXSstW
	CffWEnvuhiyoSN69Ics+wONG4oVainHf+BqfVFmw971YZga6nG1349XZg/Vm
	ll2cshWHIEia9+cLz9fe/tBZ5EbhBBnooXxDPW9nvN4pfLDm8bL6aumL0A/g
	uyhMzQwiEpghgA2yPGlDrx7xiUOhvyYOQvBDNaTE8bFd1zerrOt8H8ITABEB
	AAHCwV8EGAEIABMFAlcCvIEJEB0DzcawBL9rAhsMAADrDRAAyh5pH10I2n/U
	QfD8afms5fG2qxFcvKVJTw2t2oAzlNV7KnMdGwh8Ab7cW6OcfMYFJXFnLWC2
	m578bzDDte7g4zw+/Ux/1zL1vtIFchF3qtH1Ic48x60fo9J+b8u1X8L7pq+T
	TdRwLut03fXlVsk/joF+GVpgvJfAZZ0cCEycJNSFWEmgaC+KIVDcol8ia/iJ
	LP/zFGrphqwya2jwpDr18j5/rxbrkJDtRYvVZSZ3g815pcb211T0mOQUJfnF
	u2SOgVygWJtNI8sBS1xkbOP0AHuQz5mdQCo/1yPbsrS7VWPpsREdI009gens
	I7+A8C+oAVS8vKn1yx8USnvcJKHk/uzz8lDnAHLrbS1chf2yhw6epUfYti3b
	e5cDMfxAyKW/G6BGb7d2+wHi8Hz9DXdr+zJLAHI54y+QLwYHMMl5JY3hw8MC
	SAGEtNxoORreCMR/MI7ip4eCcdQ5eDH+IrqAcyeMUANlimXpEuJFjktT0d1N
	/VvCw/q+UEibR7UtBjkEYAsp7QBZmveV6xDU0CSAnoT/FDy5n7E0+ZWwvJ0D
	DZ2a0Iubcq+eSikqcc4/6Cmmz1QMWf5/CXTzV0jgTygfPd3LFp1jLqsOZ8h1
	1065VmAQY+eP5cyOFbrg7MJFV2fyIld2m4TwxsvTTZc6BsjuaIq0wVYhh6Wz
	+YgyABwxjVk=
	=ZjBG
	-----END PGP PUBLIC KEY BLOCK-----"
	
	@test_prikey = 
	"-----BEGIN PGP PRIVATE KEY BLOCK-----
	Version: Mailvelope v1.3.6
	Comment: https://www.mailvelope.com
	
	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
	8MbL002XOgbI7miKtMFWIYels/mIMgAcMY1Z
	=ZyOy
	-----END PGP PRIVATE KEY BLOCK-----"
	
end
